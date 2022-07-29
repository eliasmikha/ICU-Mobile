import 'dart:convert';

import 'package:starter_application/core/models/base_model.dart';
import 'package:starter_application/core/common/type_validators.dart';
import 'package:starter_application/features/account/domain/entity/register_entity.dart';

class RegisterModel extends BaseModel<RegisterEntity> {
  RegisterModel({
    required this.phoneNumber,
    required this.userName,
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.createDate,
    required this.lastModifiedDate,
    required this.creatorId,
    required this.modifierId,
    required this.creator,
    required this.modifier,
  });

  final String? phoneNumber;
  final String? userName;
  final String? name;
  final String? imageUrl;
  final String? id;
  final String? createDate;
  final String? lastModifiedDate;
  final String? creatorId;
  final String? modifierId;
  final String? creator;
  final String? modifier;

  factory RegisterModel.fromJson(String str) =>
      RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
        phoneNumber: stringV(json["phoneNumber"]),
        userName: stringV(json["userName"]),
        name: stringV(json["name"]),
        imageUrl: stringV(json["imageUrl"]),
        id: stringV(json["id"]),
        createDate: stringV(json["createDate"]),
        lastModifiedDate: stringV(json["lastModifiedDate"]),
        creatorId: stringV(json["creatorId"]),
        modifierId: stringV(json["modifierId"]),
        creator: stringV(json["creator"]),
        modifier: stringV(json["modifier"]),
      );

  Map<String, dynamic> toMap() => {
        "phoneNumber": phoneNumber,
        "userName": userName,
        "name": name,
        "imageUrl": imageUrl,
        "id": id,
        "createDate": createDate,
        "lastModifiedDate": lastModifiedDate,
        "creatorId": creatorId,
        "modifierId": modifierId,
        "creator": creator,
        "modifier": modifier,
      };

  @override
  RegisterEntity toEntity() {
    return RegisterEntity(
      name: this.name,
      id: this.id,
      createDate: this.createDate,
      creator: this.creator,
      creatorId: this.creatorId,
      imageUrl: this.imageUrl,
      lastModifiedDate: this.lastModifiedDate,
      modifier: this.modifier,
      modifierId: this.modifierId,
      phoneNumber: this.phoneNumber,
      userName: this.userName,
    );
  }
}
