import 'package:starter_application/core/entities/base_entity.dart';

class RegisterEntity extends BaseEntity {
  RegisterEntity({
    this.phoneNumber,
    this.userName,
    this.name,
    this.imageUrl,
    this.id,
    this.createDate,
    this.lastModifiedDate,
    this.creatorId,
    this.modifierId,
    this.creator,
    this.modifier,
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

  @override
  List<Object?> get props => [
        this.phoneNumber,
        this.userName,
        this.name,
        this.imageUrl,
        this.id,
        this.createDate,
        this.lastModifiedDate,
        this.creatorId,
        this.modifierId,
        this.creator,
        this.modifier,
      ];
}
