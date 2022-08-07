
part of 'imore_repository.dart';


@Singleton(as: IMoreRepository)
class MoreRepository extends IMoreRepository {
  final IMoreRemoteSource remoteDataSource;

  MoreRepository(this.remoteDataSource);
  
}
