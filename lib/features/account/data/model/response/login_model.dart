import 'dart:convert';

import 'package:starter_application/core/common/type_validators.dart';
import 'package:starter_application/core/models/base_model.dart';
import 'package:starter_application/features/account/domain/entity/login_entity.dart';

class LoginModel extends BaseModel<LoginEntity> {
  final String token;
  final AccountModel? user;

  LoginModel({
    required this.user,
    required this.token,
  });

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic>? json) => LoginModel(
        user: json?["user"] == null
            ? null
            : AccountModel.fromMap(json?["user"]),
        token: stringV(json?["token"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user == null ? null : user!.toMap(),
        "token": stringV(this.token),
      };

  @override
  LoginEntity toEntity() {
    return LoginEntity(
      user: user?.toEntity(),
      token: token,
    );
  }
}

class AccountModel extends BaseModel<AccountEntity> {
  AccountModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String? id;
  final String? name;
  final String? imageUrl;

  factory AccountModel.fromJson(String str) =>
      AccountModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountModel.fromMap(Map<String, dynamic> json) => AccountModel(
        id: stringV(json["id"]),
        name: stringV(json["name"]),
        imageUrl: stringV(json["imageUrl"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
      };

  @override
  AccountEntity toEntity() {
    return AccountEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
