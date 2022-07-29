import 'dart:convert';

import 'package:starter_application/core/models/base_model.dart';
import 'package:starter_application/features/upload/domain/entity/url_entity.dart';

class UrlModel extends BaseModel<UrlEntity> {
  final String url;

  UrlModel({required this.url});

  factory UrlModel.fromMap(Map<String, dynamic>? map) {
    return UrlModel(url: map?['data']['url']);
  }

  factory UrlModel.fromJson(String json) => UrlModel.fromMap(jsonDecode(json));

  @override
  UrlEntity toEntity() {
    return UrlEntity(url: this.url);
  }
}
