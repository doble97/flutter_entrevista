import 'package:dio/dio.dart';
import 'package:flutter_entrevista/src/config/constants.dart';

class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();

  late Dio _dio;

  factory DioSingleton() {
    return _singleton;
  }

  DioSingleton._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl, 
      headers: {'Content-Type': 'application/json'},
    );
    _dio = Dio(options);
  }

  Dio get dioInstance => _dio;

    void updateAuthToken(String authToken) {
    _dio.options.headers['Authorization'] = 'Bearer $authToken';
  }

  void clearAuthToken() {

    _dio.options.headers.remove('Authorization');
  }
}


