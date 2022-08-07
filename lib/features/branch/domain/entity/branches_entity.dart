import '../../../../../core/entities/base_entity.dart';

class BranchesEntity extends BaseEntity {
	final int? id;
	final String name;
	final String location;

	BranchesEntity({
		required this.id,
		required this.name,
		required this.location,
	});

	@override
	List<Object?> get props => [
			id,
			name,
			location,
	];
}
