import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../../core/params/base_params.dart';

class LoginRequest extends BaseParams {
  LoginRequest({
    this.username,
    this.password,
    CancelToken? cancelToken,
  }) : super(cancelToken: cancelToken!);

  final String? username;
  final String? password;

  factory LoginRequest.fromJson(String str) =>
      LoginRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromMap(Map<String, dynamic> json) => LoginRequest(
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toMap() => {
        "username": username == null ? null : username,
        "password": password == null ? null : password,
      };
}
