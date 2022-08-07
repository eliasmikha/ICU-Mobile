import '../../../../../core/params/base_params.dart';

class AddCameraParam extends BaseParams {
	final String name;
	final String url;
	final int? room_id;

	AddCameraParam({
		required this.name,
		required this.url,
		required this.room_id,
	});

	@override
	Map<String, dynamic> toMap() => {
		"name": name,
		"url": url,
		"room_id": room_id,
	};
}
