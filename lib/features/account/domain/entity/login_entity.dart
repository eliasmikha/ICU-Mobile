import 'package:starter_application/core/entities/base_entity.dart';

class LoginEntity extends BaseEntity {
  final String token;
  final AccountEntity? user;

  LoginEntity({
    required this.user,
    required this.token,
  });

  @override
  List<Object?> get props => [
        this.user,
        this.token,
      ];
}

class AccountEntity extends BaseEntity {
  AccountEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.dob,
    required this.email,
    required this.gender,
    required this.phonenumber,
  });

  final String? id;
  final String? name;
  final String? imageUrl;
  final String? dob, email, gender, phonenumber;

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.imageUrl,
        this.dob,
        this.email,
        this.gender,
        this.phonenumber,
      ];
}
