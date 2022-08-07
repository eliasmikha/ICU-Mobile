import '../../../../core/params/id_param.dart';
import '../request/model/branch_list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/datasources/remote_data_source.dart';
part 'branch_remote.dart';

abstract class IBranchRemoteSource extends RemoteDataSource {
 

	Future<Either<AppErrors, BranchListModel>> getBranchesList(IdParam param);
}
