import 'package:starter_application/core/params/id_param.dart';

import '../entity/persons_list_entity.dart';
import '../../../../core/models/empty_response.dart';
import '../../data/request/param/add_person_param.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/repositories/repository.dart';
import '../../data/datasource/ipersons_remote.dart';

part 'persons_repository.dart';

abstract class IPersonsRepository extends Repository {
	Future<Result<AppErrors, EmptyResponse>> addPerson(AddPersonParam param);

	Future<Result<AppErrors, PersonsListEntity>> getPersonsList(IdParam param);
}
