import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/features/upload/data/model/request/upload_file_param.dart';
import 'package:starter_application/features/upload/data/model/response/url_model.dart';

import '../../../../core/datasources/remote_data_source.dart';

part 'upload_remote.dart';

abstract class IUploadRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, UrlModel>> uploadFile(UploadFileParam param);
}
