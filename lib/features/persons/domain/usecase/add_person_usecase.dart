import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_person_param.dart';
import '../repository/ipersons_repository.dart';

@singleton
class AddPersonUsecase extends UseCase<EmptyResponse, AddPersonParam> {
	final IPersonsRepository repository;

	AddPersonUsecase(this.repository);

	@override
	Future<Result<AppErrors, EmptyResponse>> call(AddPersonParam param) async {
		return await repository.addPerson(param);
	}
}
