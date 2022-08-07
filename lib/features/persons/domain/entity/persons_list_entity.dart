import '../../../../../core/entities/base_entity.dart';

import 'persons_entity.dart';

class PersonsListEntity extends BaseEntity {
	final List<PersonsEntity> persons;

	PersonsListEntity({
		required this.persons,
	});

	@override
	List<Object?> get props => [
			persons,
	];
}
