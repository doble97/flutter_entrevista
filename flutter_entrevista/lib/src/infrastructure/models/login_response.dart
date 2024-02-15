
import 'dart:convert';

import 'package:flutter_entrevista/src/domain/entities/user.dart';


class LoginResponse {
    bool success;
    String message;
    Data data;

    LoginResponse({
        required this.success,        required this.message,
        required this.data,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String token;
    User user;

    Data({
        required this.token,
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
    };
}

// {
//   "success": true,
//   "message": "Correct login",
//   "data": {
//     "token": "",
//     "user": {
//       "id": 1,
//       "name": "Jorge Gonzalez",
//       "rol_id": 3,
//       "email": "jorgegonzalez@gmail.com",
//       "email_verified_at": null,
//       "created_at": "2024-02-14T00:25:13.000000Z",
//       "updated_at": "2024-02-14T00:25:13.000000Z"
//     }
//   }
// }