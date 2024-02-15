import 'package:flutter_entrevista/src/domain/entities/user.dart';

class Auth{
  final String token;
  final User user;

  Auth({required this.token, required this.user});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      token: json['token'] as String,
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user.toJson(),
    };
  }
}