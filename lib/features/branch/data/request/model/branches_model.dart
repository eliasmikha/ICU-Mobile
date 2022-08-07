import 'dart:convert';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/branches_entity.dart';

class BranchesModel extends BaseModel<BranchesEntity> {
	final int? id;
	final String name;
	final String location;

	BranchesModel({
		required this.id,
		required this.name,
		required this.location,
	});

	factory BranchesModel.fromMap(Map<String, dynamic>? map) =>
		BranchesModel(
			id: numV(map?["id"]),
			name: stringV(map?["name"]),
			location: stringV(map?["location"]),
		);

	factory BranchesModel.fromJson(String map) =>
			BranchesModel.fromMap(json.decode(map));

	@override
	BranchesEntity toEntity() => BranchesEntity(
		id: id,
		name: name,
		location: location,
	);
}
