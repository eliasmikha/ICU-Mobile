import '../../../../../core/entities/base_entity.dart';

class CameraEntity extends BaseEntity {
	final int? id;
	final int? roomId;
	final String name;
	final String url;

	CameraEntity({
		required this.id,
		required this.roomId,
		required this.name,
		required this.url,
	});

	@override
	List<Object?> get props => [
			id,
			roomId,
			name,
			url,
	];
}
