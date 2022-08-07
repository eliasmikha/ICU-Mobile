import 'package:starter_application/core/params/id_param.dart';

import '../request/model/persons_list_model.dart';
import '../../../../core/models/empty_response.dart';
import '../request/param/add_person_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/datasources/remote_data_source.dart';
part 'persons_remote.dart';

abstract class IPersonsRemoteSource extends RemoteDataSource {
 

	Future<Either<AppErrors, EmptyResponse>> addPerson(AddPersonParam param);

	Future<Either<AppErrors, PersonsListModel>> getPersonsList(IdParam param);
}
