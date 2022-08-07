import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_department_param.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/repositories/repository.dart';
import '../../data/datasource/idepartment_remote.dart';

part 'department_repository.dart';

abstract class IDepartmentRepository extends Repository {
	Future<Result<AppErrors, EmptyResponse>> addDepartment(AddDepartmentParam param);
}
