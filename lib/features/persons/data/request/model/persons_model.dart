import 'dart:convert';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/persons_entity.dart';

class PersonsModel extends BaseModel<PersonsEntity> {
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

	PersonsModel({
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

	factory PersonsModel.fromMap(Map<String, dynamic>? map) =>
		PersonsModel(
			id: numV(map?["id"]),
			detectedBycamId: numV(map?["detectedBycamId"]),
			name: stringV(map?["name"]),
			age: numV(map?["age"]),
			gender: stringV(map?["gender"]),
			phonenumber: dateTimeV(map?["phonenumber"]),
			position: stringV(map?["position"]),
			dob: dateTimeV(map?["dob"]),
			imageLink: stringV(map?["imageLink"]),
			createdAt: dateTimeV(map?["createdAt"]),
			updatedAt: dateTimeV(map?["updatedAt"]),
		);

	factory PersonsModel.fromJson(String map) =>
			PersonsModel.fromMap(json.decode(map));

	@override
	PersonsEntity toEntity() => PersonsEntity(
		id: id,
		detectedBycamId: detectedBycamId,
		name: name,
		age: age,
		gender: gender,
		phonenumber: phonenumber,
		position: position,
		dob: dob,
		imageLink: imageLink,
		createdAt: createdAt,
		updatedAt: updatedAt,
	);
}
