import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weahter/core/helpers/functions.dart';
import 'package:weahter/core/networking/api_response.dart';
import 'package:weahter/features/home/data/models/weather_response_model.dart';
import 'package:weahter/features/home/data/repo/home_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepo) : super(WeatherInitial());

  final WeatherRepo weatherRepo;
  final TextEditingController searchController = TextEditingController();
  Color bgColor = Colors.green;
  String lat = '';
  String long = '';

  Future<void> getWeather() async {
    final city = searchController.text.trim();
    if (city.isEmpty) {
      emit(WeatherError(message: 'City name cannot be empty'));
      return;
    }
    emit(WeatherLoading());
    try {
      ApiResponse weatherResponse = await weatherRepo.getWeather(city);
      if (weatherResponse.response != null && weatherResponse.response!.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = weatherResponse.response!.data;
        final weather = WeatherResponseModel.fromJson(jsonResponse);
        bgColor = await getBackgroundColor(weather.forCast[0].weatherDescription);
        emit(WeatherSuccess(weatherResponse: weather));
      } else {
        final errorMessage = weatherResponse.error?.toString() ?? 'Unknown error';
        emit(WeatherError(message: errorMessage));
      }
    } catch (e) {
      emit(WeatherError(message: 'Failed to fetch weather data: $e'));
    } finally {
      searchController.clear(); // Optional: Clear the search field after fetching
    }
  }

  Future<void> fetchAndSetLocation() async {
    emit(WeatherLoading());
    try {
      Position position = await getCurrentPosition();
      lat = position.latitude.toString();
      long = position.longitude.toString();
      searchController.text = '$lat,$long';
      await getWeather();
    } catch (e) {
      emit(WeatherError(message: 'Failed to fetch location: $e'));
    }
  }

  Future<Color> getBackgroundColor(String condition) async {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return Colors.orange; // Bright sunny
      case 'partly cloudy':
        return Colors.yellow[700]!; // Partly cloudy
      case 'cloudy':
        return Colors.grey; // Overcast
      case 'rainy':
        return Colors.blue; // Rainy
      case 'showers':
        return Colors.lightBlue; // Showers
      case 'thunderstorm':
        return Colors.indigo; // Thunderstorms
      case 'snowy':
        return Colors.white; // Snowy
      case 'foggy':
        return Colors.grey[400]!; // Foggy
      case 'hazy':
        return Colors.brown; // Hazy
      case 'windy':
        return Colors.teal; // Windy
      case 'clear':
        return Colors.cyan; // Clear
      case 'dust':
        return Colors.orange[300]!; // Dusty
      case 'mist':
        return Colors.blueGrey; // Misty
      case 'sleet':
        return Colors.blueGrey[700]!; // Sleet
      case 'hail':
        return Colors.grey[600]!; // Hail
      case 'tornado':
        return Colors.redAccent; // Tornado
      default:
        return Colors.green; // Default color for unknown conditions
    }
  }
}
