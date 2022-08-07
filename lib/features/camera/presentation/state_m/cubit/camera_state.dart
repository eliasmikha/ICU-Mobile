part of 'camera_cubit.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState.cameraInit() = CameraInitState;

  const factory CameraState.cameraLoading() = CameraLoadingState;

  const factory CameraState.cameraError(
    AppErrors error,
    VoidCallback callback,
  ) = CameraErrorState;

	const factory CameraState.camerasListLoaded(
		List<CameraEntity> cameraEntity,
	) = CamerasListLoadedState;
}
