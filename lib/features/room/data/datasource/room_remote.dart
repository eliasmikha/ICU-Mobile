part of 'iroom_remote.dart';

@Singleton(as: IRoomRemoteSource)
class RoomRemoteSource extends IRoomRemoteSource {
	@override
	Future<Either<AppErrors, EmptyResponse>> addRoom(AddRoomParam param) async {
		return await request(
			converter: (json) => EmptyResponse.fromMap(json),
			method: HttpMethod.POST,
			url: APIUrls.ADD_ROOM_API,
			body: param.toMap(),
		);
	}
}
