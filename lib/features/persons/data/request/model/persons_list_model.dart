import 'dart:convert';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/persons_list_entity.dart';

import 'persons_model.dart';

class PersonsListModel extends BaseModel<PersonsListEntity> {
	final List<PersonsModel> persons;

	PersonsListModel({
		required this.persons,
	});

	factory PersonsListModel.fromMap(Map<String, dynamic>? map) =>
		PersonsListModel(
			persons: map?["persons"] == null ? [] : List<PersonsModel>.from(map?["persons"].map((x) => PersonsModel.fromMap(x))),
		);

	factory PersonsListModel.fromJson(String map) =>
			PersonsListModel.fromMap(json.decode(map));

	@override
	PersonsListEntity toEntity() => PersonsListEntity(
		persons: persons.toListEntity(),
	);
}
