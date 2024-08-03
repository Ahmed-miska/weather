import 'package:dio/dio.dart';
import 'package:weahter/core/networking/api_constants.dart';
import 'package:weahter/core/networking/api_error_handler.dart';
import 'package:weahter/core/networking/api_response.dart';
import 'package:weahter/core/networking/api_service.dart';

class WeatherRepo {
  final ApiService apiService;

  WeatherRepo(this.apiService);

  Future<ApiResponse> getWeather(String city) async {
    try {
      Response response = await apiService.get(endpoint: ApiConstants.apiBaseUrl, query: {
        "key": ApiConstants.token,
        "q": city,
        "days": "5",
        "aqi": "yes",
        "alerts": "no",
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
