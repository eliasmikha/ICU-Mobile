import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_department_param.dart';
import '../repository/idepartment_repository.dart';

@singleton
class AddDepartmentUsecase extends UseCase<EmptyResponse, AddDepartmentParam> {
	final IDepartmentRepository repository;

	AddDepartmentUsecase(this.repository);

	@override
	Future<Result<AppErrors, EmptyResponse>> call(AddDepartmentParam param) async {
		return await repository.addDepartment(param);
	}
}
