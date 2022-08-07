part of 'ipersons_remote.dart';

@Singleton(as: IPersonsRemoteSource)
class PersonsRemoteSource extends IPersonsRemoteSource {
  

	@override
	Future<Either<AppErrors, EmptyResponse>> addPerson(AddPersonParam param) async {
		return await request(
			converter: (json) => EmptyResponse.fromMap(json),
			method: HttpMethod.POST,
			url: APIUrls.ADD_PERSON_API,
			body: param.toMap(),
		);
	}

	@override
	Future<Either<AppErrors, PersonsListModel>> getPersonsList(IdParam param) async {
		return await request(
			converter: (json) => PersonsListModel.fromMap(json),
			method: HttpMethod.GET,
			url: APIUrls.personsListApi(param.id),
		);
	}
}
