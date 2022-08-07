part of 'iroom_repository.dart';

@Singleton(as: IRoomRepository)
class RoomRepository extends IRoomRepository {
  final IRoomRemoteSource remoteDataSource;

  RoomRepository(this.remoteDataSource);
}
