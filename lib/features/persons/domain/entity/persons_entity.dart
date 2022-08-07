import '../../../../../core/entities/base_entity.dart';

class PersonsEntity extends BaseEntity {
	final int? id;
	final int? detectedBycamId;
	final String name;
	final int? age;
	final String gender;
	final DateTime? phonenumber;
	final String position;
	final DateTime? dob;
	final String imageLink;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	PersonsEntity({
		required this.id,
		required this.detectedBycamId,
		required this.name,
		required this.age,
		required this.gender,
		required this.phonenumber,
		required this.position,
		required this.dob,
		required this.imageLink,
		required this.createdAt,
		required this.updatedAt,
	});

	@override
	List<Object?> get props => [
			id,
			detectedBycamId,
			name,
			age,
			gender,
			phonenumber,
			position,
			dob,
			imageLink,
			createdAt,
			updatedAt,
	];
}
