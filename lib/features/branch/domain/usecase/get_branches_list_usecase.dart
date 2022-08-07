import 'package:injectable/injectable.dart';
import 'package:starter_application/core/params/id_param.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/params/no_params.dart';
import '../entity/branch_list_entity.dart';
import '../repository/ibranch_repository.dart';

@singleton
class GetBranchesListUsecase extends UseCase<BranchListEntity, IdParam> {
	final IBranchRepository repository;

	GetBranchesListUsecase(this.repository);

	@override
	Future<Result<AppErrors, BranchListEntity>> call(IdParam param) async {
		return await repository.getBranchesList(param);
	}
}
