import '../../../../../core/params/base_params.dart';

class AddBranchParam extends BaseParams {
	final String name;
	final String location;

	AddBranchParam({
		required this.name,
		required this.location,
	});

	@override
	Map<String, dynamic> toMap() => {
		"name": name,
		"location": location,
	};
}
