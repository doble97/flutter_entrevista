import 'package:flutter_entrevista/src/domain/entities/user.dart';

abstract class AuthDatasource<T> {
  Future<T?> login(String email, String password);
}
