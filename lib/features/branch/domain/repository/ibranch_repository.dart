import 'package:starter_application/core/params/id_param.dart';

import '../entity/branch_list_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/repositories/repository.dart';
import '../../data/datasource/ibranch_remote.dart';

part 'branch_repository.dart';

abstract class IBranchRepository extends Repository {
  

	Future<Result<AppErrors, BranchListEntity>> getBranchesList(IdParam param);
}
