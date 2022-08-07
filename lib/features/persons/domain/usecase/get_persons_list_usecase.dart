import 'package:injectable/injectable.dart';
import 'package:starter_application/core/params/id_param.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/persons_list_entity.dart';
import '../repository/ipersons_repository.dart';

@singleton
class GetPersonsListUsecase extends UseCase<PersonsListEntity, IdParam> {
	final IPersonsRepository repository;

	GetPersonsListUsecase(this.repository);

	@override
	Future<Result<AppErrors, PersonsListEntity>> call(IdParam param) async {
		return await repository.getPersonsList(param);
	}
}
