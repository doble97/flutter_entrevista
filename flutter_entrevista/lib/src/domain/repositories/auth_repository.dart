import 'package:flutter_entrevista/src/domain/entities/user.dart';

abstract class AuthRepository <T>{
  Future<T> login({required String email, required String password});
}
