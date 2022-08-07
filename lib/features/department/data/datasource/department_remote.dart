part of 'idepartment_remote.dart';

@Singleton(as: IDepartmentRemoteSource)
class DepartmentRemoteSource extends IDepartmentRemoteSource {
	@override
	Future<Either<AppErrors, EmptyResponse>> addDepartment(AddDepartmentParam param) async {
		return await request(
			converter: (json) => EmptyResponse.fromMap(json),
			method: HttpMethod.POST,
			url: APIUrls.ADD_DEPARTMENT_API,
			body: param.toMap(),
		);
	}
}
