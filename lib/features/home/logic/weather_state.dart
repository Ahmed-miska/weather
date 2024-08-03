part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherResponseModel weatherResponse;

  WeatherSuccess({required this.weatherResponse});
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}
