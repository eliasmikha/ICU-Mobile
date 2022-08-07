part of 'iroom_repository.dart';

@Singleton(as: IRoomRepository)
class RoomRepository extends IRoomRepository {
  final IRoomRemoteSource remoteDataSource;

  RoomRepository(this.remoteDataSource);

	@override
	Future<Result<AppErrors, EmptyResponse>> addRoom(AddRoomParam param) async {
		return executeForNoEntity(
			remoteResult: await remoteDataSource.addRoom(param),
		);
	}
}
