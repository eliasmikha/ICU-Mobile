part of 'icamera_remote.dart';

@Singleton(as: ICameraRemoteSource)
class CameraRemoteSource extends ICameraRemoteSource {
  

	@override
	Future<Either<AppErrors, List<CameraModel>>> getAllCameras() async {
		return await listRequest(
			converter: (json) => CameraModel.fromMap(json),
			method: HttpMethod.GET,
			url: APIUrls.CAMERAS_LIST_API,
      createModelInterceptor: const AllDataCreateModel(),
		);
	}
}
