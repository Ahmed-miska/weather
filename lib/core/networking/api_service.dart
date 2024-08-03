import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weahter/core/networking/api_constants.dart';

class ApiService {
  final String _baseUrl = ApiConstants.apiBaseUrl;
  final Dio _dio;

  ApiService(this._dio) {
    _dio
      ..options.baseUrl = _baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
  }

  Future<Response> get({required String endpoint, Map<String, dynamic>? query}) async {
    try {
      var response = await _dio.get('$_baseUrl$endpoint', queryParameters: query);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
