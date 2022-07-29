import 'dart:convert';
import '../common/type_validators.dart';
import '../entities/name_entity.dart';
import 'base_model.dart';

class NameModel extends BaseModel<NameEntity> {
  NameModel({required this.id, required this.name});

  final int? id;
  final String name;

  factory NameModel.fromJson(String str) => NameModel.fromMap(json.decode(str));

  factory NameModel.fromMap(Map<String, dynamic> json) => NameModel(
        id: numV(json["id"]),
        name: stringV(json["name"]),
      );

  @override
  NameEntity toEntity() => NameEntity(id: id, name: name);
}
