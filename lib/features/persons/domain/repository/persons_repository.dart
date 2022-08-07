part of 'ipersons_repository.dart';

@Singleton(as: IPersonsRepository)
class PersonsRepository extends IPersonsRepository {
  final IPersonsRemoteSource remoteDataSource;

  PersonsRepository(this.remoteDataSource);

	@override
	Future<Result<AppErrors, EmptyResponse>> addPerson(AddPersonParam param) async {
		return executeForNoEntity(
			remoteResult: await remoteDataSource.addPerson(param),
		);
	}

	@override
	Future<Result<AppErrors, PersonsListEntity>> getPersonsList(IdParam param) async {
		return execute(
			remoteResult: await remoteDataSource.getPersonsList(param),
		);
	}
}
