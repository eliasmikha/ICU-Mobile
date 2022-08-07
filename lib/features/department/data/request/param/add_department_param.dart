import '../../../../../core/params/base_params.dart';

class AddDepartmentParam extends BaseParams {
	final String name;
	final String location;
	final int? branch_id;

	AddDepartmentParam({
		required this.name,
		required this.location,
		required this.branch_id,
	});

	@override
	Map<String, dynamic> toMap() => {
		"name": name,
		"location": location,
		"branch_id": branch_id,
	};
}
