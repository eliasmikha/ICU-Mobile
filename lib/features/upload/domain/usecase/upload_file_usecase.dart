import 'package:injectable/injectable.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/core/usecases/usecase.dart';
import 'package:starter_application/features/upload/data/model/request/upload_file_param.dart';
import 'package:starter_application/features/upload/domain/entity/url_entity.dart';
import 'package:starter_application/features/upload/domain/repository/iupload_repository.dart';

@singleton
class UploadFileUsecase extends UseCase<UrlEntity, UploadFileParam> {
  final IUploadRepository iUploadRepository;

  UploadFileUsecase(this.iUploadRepository);

  @override
  Future<Result<AppErrors, UrlEntity>> call(UploadFileParam params) async {
    return await iUploadRepository.uploadFile(params);
  }
}
