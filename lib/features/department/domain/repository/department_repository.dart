part of 'idepartment_repository.dart';

@Singleton(as: IDepartmentRepository)
class DepartmentRepository extends IDepartmentRepository {
  final IDepartmentRemoteSource remoteDataSource;

  DepartmentRepository(this.remoteDataSource);

	@override
	Future<Result<AppErrors, EmptyResponse>> addDepartment(AddDepartmentParam param) async {
		return executeForNoEntity(
			remoteResult: await remoteDataSource.addDepartment(param),
		);
	}
}
