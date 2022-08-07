
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
}
