
part of 'ibranch_repository.dart';


@Singleton(as: IBranchRepository)
class BranchRepository extends IBranchRepository {
  final IBranchRemoteSource remoteDataSource;

  BranchRepository(this.remoteDataSource);
  

	@override
	Future<Result<AppErrors, BranchListEntity>> getBranchesList(IdParam param) async {
		return execute(
			remoteResult: await remoteDataSource.getBranchesList(param),
		);
	}

	@override
	Future<Result<AppErrors, EmptyResponse>> addBranch(AddBranchParam param) async {
		return executeForNoEntity(
			remoteResult: await remoteDataSource.addBranch(param),
		);
	}
}
