import 'dart:convert';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/branch_list_entity.dart';

import 'branches_model.dart';

class BranchListModel extends BaseModel<BranchListEntity> {
	final List<BranchesModel> branches;

	BranchListModel({
		required this.branches,
	});

	factory BranchListModel.fromMap(Map<String, dynamic>? map) =>
		BranchListModel(
			branches: map?["branches"] == null ? [] : List<BranchesModel>.from(map?["branches"].map((x) => BranchesModel.fromMap(x))),
		);

	factory BranchListModel.fromJson(String map) =>
			BranchListModel.fromMap(json.decode(map));

	@override
	BranchListEntity toEntity() => BranchListEntity(
		branches: branches.toListEntity(),
	);
}
