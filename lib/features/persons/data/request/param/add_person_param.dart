import '../../../../../core/params/base_params.dart';

class AddPersonParam extends BaseParams {
	final int? age;
	final DateTime? dob;
	final String gender;
	final String name;
	final String phonenumber;
	final String position;

	AddPersonParam({
		required this.age,
		required this.dob,
		required this.gender,
		required this.name,
		required this.phonenumber,
		required this.position,
	});

	@override
	Map<String, dynamic> toMap() => {
		"age": age,
		"dob": dob?.toIso8601String(),
		"gender": gender,
		"name": name,
		"phonenumber": phonenumber,
		"position": position,
	};
}
