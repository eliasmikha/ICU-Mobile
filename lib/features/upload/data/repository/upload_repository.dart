part of '../../domain/repository/iupload_repository.dart';

@Singleton(as: IUploadRepository)
class UploadRepository extends IUploadRepository {
  final IUploadRemoteSource iUploadRemoteSource;

  UploadRepository(this.iUploadRemoteSource);

  @override
  Future<Result<AppErrors, UrlEntity>> uploadFile(UploadFileParam param) async {
    return execute<UrlModel, UrlEntity>(
      remoteResult: await iUploadRemoteSource.uploadFile(param),
    );
  }
}
