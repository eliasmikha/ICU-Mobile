import 'package:injectable/injectable.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/core/usecases/usecase.dart';
import 'package:starter_application/features/home/data/model/request/mock_request.dart';
import 'package:starter_application/features/home/domain/entity/people_entity.dart';
import 'package:starter_application/features/home/domain/repository/ihome_repository.dart';

@injectable
class GetPeopleUseCase extends UseCase<PeopleDataEntity, MockRequest> {
  final IHomeRepository iHomeRepository;

  GetPeopleUseCase(this.iHomeRepository);

  @override
  Future<Result<AppErrors, PeopleDataEntity>> call(MockRequest params) async =>
      await iHomeRepository.getPeople(params);
}
