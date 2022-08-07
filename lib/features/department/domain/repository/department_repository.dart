part of 'idepartment_repository.dart';

@Singleton(as: IDepartmentRepository)
class DepartmentRepository extends IDepartmentRepository {
  final IDepartmentRemoteSource remoteDataSource;

  DepartmentRepository(this.remoteDataSource);
}
