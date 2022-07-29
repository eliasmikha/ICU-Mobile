import 'base_entity.dart';

class NameEntity extends BaseEntity {
  NameEntity({
    required this.id,
    required this.name,
  });

  final int? id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
