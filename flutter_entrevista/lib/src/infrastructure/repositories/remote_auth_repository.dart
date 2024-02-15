import 'package:flutter_entrevista/src/domain/datasources/auth_datasource.dart';
import 'package:flutter_entrevista/src/domain/repositories/auth_repository.dart';
import 'package:flutter_entrevista/src/infrastructure/models/auth.dart';
import 'package:flutter_entrevista/src/infrastructure/models/login_response.dart';

class RemoteAuthRepository extends AuthRepository<Auth>{

  final AuthDatasource _datasource;

  RemoteAuthRepository(this._datasource);

  @override
  Future<Auth> login({required String email, required String password}) async {
    final _loginResponse = await _datasource.login(email, password) as LoginResponse;
    final _auth = Auth(token: _loginResponse.data.token, user: _loginResponse.data.user);
    return _auth;
  }

}
