import 'package:starter_application/core/entities/base_entity.dart';

class UrlEntity extends BaseEntity {
  final String url;

  UrlEntity({required this.url});

  @override
  List<Object?> get props => [url];
}
