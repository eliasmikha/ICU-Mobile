import '../../../../../core/params/base_params.dart';

class AddRoomParam extends BaseParams {
	final String name;
	final int? dep_id;

	AddRoomParam({
		required this.name,
		required this.dep_id,
	});

	@override
	Map<String, dynamic> toMap() => {
		"name": name,
		"dep_id": dep_id,
	};
}
