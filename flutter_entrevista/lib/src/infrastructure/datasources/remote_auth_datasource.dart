import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_entrevista/src/config/constants.dart';
import 'package:flutter_entrevista/src/domain/datasources/auth_datasource.dart';
import 'package:flutter_entrevista/src/infrastructure/errors/incorrect_credentials.dart';
import 'package:flutter_entrevista/src/infrastructure/models/login_response.dart';
import 'package:flutter_entrevista/src/infrastructure/network/dio_singleton.dart';

class RemoteAuthDatasource extends AuthDatasource<LoginResponse> {
  final _dio = DioSingleton().dioInstance;

  @override
  Future<LoginResponse?> login(String email, String password) async {
    try {
      final response = await _dio.post(loginUrl,
          data: jsonEncode({"email": email, "password": password}));
      if (response.statusCode == 401) {
        throw IncorrectCredentials("Credenciales incorrectas");
      }

      final _loginResponse = LoginResponse.fromJson(response.data);
      return _loginResponse;
    } catch (e) {
      throw Exception('Problemas técnicos');
    }
  }
}
