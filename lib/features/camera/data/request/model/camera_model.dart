import 'dart:convert';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/camera_entity.dart';

class CameraModel extends BaseModel<CameraEntity> {
  final int? id;
  final int? roomId;
  final String name;
  final String url;

  CameraModel({
    required this.id,
    required this.roomId,
    required this.name,
    required this.url,
  });

  factory CameraModel.fromMap(Map<String, dynamic>? map) => CameraModel(
        id: numV(map?["id"]),
        roomId: numV(map?["room_id"]),
        name: stringV(map?["name"]),
        url: stringV(map?["url"]),
      );

  factory CameraModel.fromJson(String map) =>
      CameraModel.fromMap(json.decode(map));

  @override
  CameraEntity toEntity() => CameraEntity(
        id: id,
        roomId: roomId,
        name: name,
        url: url,
      );
}
