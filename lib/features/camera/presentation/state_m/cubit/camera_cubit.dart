import '../../../domain/usecase/add_camera_usecase.dart';
import '../../../data/request/param/add_camera_param.dart';
import '../../../../../core/params/no_params.dart';
import '../../../domain/usecase/get_all_cameras_usecase.dart';
import '../../../domain/entity/camera_entity.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../core/errors/app_errors.dart';

part 'camera_state.dart';

part 'camera_cubit.freezed.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(const CameraState.cameraInit());

	void getAllCameras() async {
		emit(const CameraState.cameraLoading());

		final result = await getIt<GetAllCamerasUsecase>()(NoParams());

		result.pick(
			onData: (data) {
				emit(CameraState.camerasListLoaded(data));
			},
			onError: (error) {
				emit(CameraState.cameraError(error, () => getAllCameras()));
			},
		);
	}

	void addCamera(AddCameraParam param) async {
		emit(const CameraState.cameraLoading());

		final result = await getIt<AddCameraUsecase>()(param);

		result.pick(
			onData: (data) {
				emit(const CameraState.successAddCamera());
			},
			onError: (error) {
				emit(CameraState.cameraError(error, () => addCamera(param)));
			},
		);
	}
}
