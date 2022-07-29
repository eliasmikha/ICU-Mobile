import 'package:dio/dio.dart';
import 'package:starter_application/core/params/base_params.dart';

class RegisterRequest extends BaseParams {
  RegisterRequest({
    this.name,
    this.username,
    this.gender,
    this.dob,
    this.phonenumber,
    this.email,
    this.password,
    CancelToken? cancelToken,
  }) : super(cancelToken: cancelToken!);

  final String? name;
  final String? username;
  final int? gender;
  final String? dob;
  final String? phonenumber;
  final String? email;
  final String? password;

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "gender": gender == null ? null : gender,
        "dob": dob == null ? null : dob,
        "phonenumber": phonenumber == null ? null : phonenumber,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}
