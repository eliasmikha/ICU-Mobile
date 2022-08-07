import '../../../../../core/entities/base_entity.dart';

import 'branches_entity.dart';

class BranchListEntity extends BaseEntity {
	final List<BranchesEntity> branches;

	BranchListEntity({
		required this.branches,
	});

	@override
	List<Object?> get props => [
			branches,
	];
}
