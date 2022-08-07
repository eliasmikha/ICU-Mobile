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

	@override
	Future<Either<AppErrors, EmptyResponse>> addCamera(AddCameraParam param) async {
		return await request(
			converter: (json) => EmptyResponse.fromMap(json),
			method: HttpMethod.POST,
			url: APIUrls.ADD_CAMERA_API,
			body: param.toMap(),
		);
	}
}
