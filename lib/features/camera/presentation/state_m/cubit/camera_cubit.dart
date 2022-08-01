import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../core/errors/app_errors.dart';

part 'camera_state.dart';

part 'camera_cubit.freezed.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(const CameraState.cameraInit());
}
