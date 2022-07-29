import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_application/di/service_locator.dart';
import 'package:starter_application/features/upload/data/model/request/upload_file_param.dart';
import 'package:starter_application/features/upload/domain/entity/url_entity.dart';
import 'package:starter_application/features/upload/domain/usecase/upload_file_usecase.dart';

import '../../../../../core/errors/app_errors.dart';

part 'upload_cubit.freezed.dart';
part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(const UploadState.uploadInitState());

  void uploadFile(UploadFileParam param) async {
    emit(const UploadState.uploadLoadingState());

    final result = await getIt<UploadFileUsecase>()(param);

    result.pick(
      onData: (data) {
        emit(UploadState.uploadSuccessState(data));
      },
      onError: (error) {
        emit(UploadState.uploadErrorState(error, () {
          uploadFile(param);
        }));
      },
    );
  }
}
