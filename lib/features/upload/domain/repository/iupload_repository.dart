import 'package:injectable/injectable.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/features/upload/data/datasource/iupload_remote.dart';
import 'package:starter_application/features/upload/data/model/request/upload_file_param.dart';
import 'package:starter_application/features/upload/data/model/response/url_model.dart';
import 'package:starter_application/features/upload/domain/entity/url_entity.dart';

import '../../../../core/repositories/repository.dart';

part '../../data/repository/upload_repository.dart';

abstract class IUploadRepository extends Repository {
  Future<Result<AppErrors, UrlEntity>> uploadFile(UploadFileParam param);
}
