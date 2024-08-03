import 'package:dio/dio.dart';
import 'package:weahter/core/networking/error_response.dart';

class ApiErrorHandler {
  static String getMessage(dynamic error) {
    String errorDescription = "";

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout with server";
          break;
        case DioExceptionType.badResponse:
          switch (error.response?.statusCode) {
            case 404:
              errorDescription = "Requested resource not found";
              break;
            case 500:
              errorDescription = "Internal server error";
              break;
            case 503:
              errorDescription = "Service unavailable";
              break;
            default:
              try {
                final errorResponse = ErrorResponse.fromJson(error.response?.data ?? {});
                errorDescription = errorResponse.error.message.isNotEmpty ? errorResponse.error.message : "Failed to load data - status code: ${error.response?.statusCode}";
              } catch (e) {
                errorDescription = "Failed to parse error response";
              }
          }
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad certificate";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Connection error";
          break;
        case DioExceptionType.unknown:
          errorDescription = "Connection to API server failed due to internet connection";
          break;
        default:
          errorDescription = "Unexpected error occurred";
      }
    } else {
      errorDescription = "Non-Dio exception occurred: $error";
    }

    return errorDescription;
  }
}
