part of 'ibranch_remote.dart';

@Singleton(as: IBranchRemoteSource)
class BranchRemoteSource extends IBranchRemoteSource {
  

	@override
	Future<Either<AppErrors, BranchListModel>> getBranchesList(IdParam param) async {
		return await request(
			converter: (json) => BranchListModel.fromMap(json),
			method: HttpMethod.GET,
			url: APIUrls.branchListApi(param.id),
		);
	}
}
