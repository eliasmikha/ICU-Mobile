
part of 'icamera_repository.dart';


@Singleton(as: ICameraRepository)
class CameraRepository extends ICameraRepository {
  final ICameraRemoteSource remoteDataSource;

  CameraRepository(this.remoteDataSource);
  
}
