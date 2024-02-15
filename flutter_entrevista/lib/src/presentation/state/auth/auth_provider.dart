import 'package:flutter_entrevista/src/domain/repositories/auth_repository.dart';
import 'package:flutter_entrevista/src/infrastructure/datasources/remote_auth_datasource.dart';
import 'package:flutter_entrevista/src/infrastructure/errors/incorrect_credentials.dart';
import 'package:flutter_entrevista/src/infrastructure/models/auth.dart';
import 'package:flutter_entrevista/src/infrastructure/network/dio_singleton.dart';
import 'package:flutter_entrevista/src/infrastructure/repositories/remote_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum UserStatus{
  authenticated, notAuthenticated
}

class AuthState{
  final Auth? auth;
  final String  message;
  final UserStatus userStatus;

  AuthState({
    this.auth, this.message="", this.userStatus = UserStatus.notAuthenticated
  });
}

class AuthNotifier extends StateNotifier<AuthState>{
  final AuthRepository _repository;

  AuthNotifier(this._repository):super(AuthState());

  Future<void> login({required String email, required String password})async{
    try {
      final Auth _auth = await _repository.login(email: email, password: password);
      state = AuthState(auth: _auth, userStatus: UserStatus.authenticated);
      DioSingleton().updateAuthToken(state.auth!.token);
    } on IncorrectCredentials catch (err) {
      state = AuthState(auth: null, message: err.message, userStatus: UserStatus.notAuthenticated);
    } catch (err) {
      state = AuthState(auth: null, message: err.toString(), userStatus: UserStatus.notAuthenticated);
    }
  }

  void logout(){
    //implementar llamada al backend 
    state = AuthState(auth: null, message: '', userStatus: UserStatus.notAuthenticated);
    DioSingleton().clearAuthToken();
  }
  
}


final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref){
  return AuthNotifier(RemoteAuthRepository(RemoteAuthDatasource()));
});