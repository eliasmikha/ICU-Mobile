part of 'iupload_remote.dart';

@Singleton(as: IUploadRemoteSource)
class UploadRemoteSource extends IUploadRemoteSource {
  @override
  Future<Either<AppErrors, UrlModel>> uploadFile(UploadFileParam param) async {
    return requestUploadFile(
      converter: (json) => UrlModel.fromMap(json),
      //Todo: change to your own url
      url: '',
      fileKey: 'file',
      filePath: param.imageUrl,
      onReceiveProgress: param.onReceiveProgress,
      onSendProgress: param.onSendProgress,
      withAuthentication: true,
      data: {},
    );
  }
}
