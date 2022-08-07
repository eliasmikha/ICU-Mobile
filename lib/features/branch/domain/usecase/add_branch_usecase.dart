import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_branch_param.dart';
import '../repository/ibranch_repository.dart';

@singleton
class AddBranchUsecase extends UseCase<EmptyResponse, AddBranchParam> {
	final IBranchRepository repository;

	AddBranchUsecase(this.repository);

	@override
	Future<Result<AppErrors, EmptyResponse>> call(AddBranchParam param) async {
		return await repository.addBranch(param);
	}
}
