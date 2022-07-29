import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/features/splash/domain/entity/splash_entity.dart';

import '../../../../core/common/utils/cubit_utils.dart';
import '../../../../core/errors/app_errors.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  void getSplash({CancelToken? cancelToken}) async {
    emit(const SplashState.loading());

    // TODO : remove this line.
    await Future.delayed(const Duration(seconds: 2));

    final List<Result> results = await Future.wait([]);
    final error = CubitUtils.checkError(results);

    if (error != null) {
      emit(SplashState.error(error: error, callback: () => this.getSplash()));
    } else {
      if (LocalStorage.hasToken) {
        emit(SplashState.loaded(SplashEntity()));
      } else {
        emit(SplashState.loaded(SplashEntity()));
      }
    }
  }

  // TODO Uncomment this
  // void _handleNotAuthenticatedRequests(
  //     List<Result<AppErrors, Object>> result) async {
  //   if (result[0].hasErrorOnly || result[1].hasErrorOnly) {
  //     emit(SplashState.error(
  //       error: result[0].hasErrorOnly ? result[0].error! : result[1].error!,
  //       callback: () => this.getHomeInitAndProfile(),
  //     ));
  //   } else {
  //     if (int.parse(AppConfig().buildNumber!) <
  //         ((result[1].data as AppUpdateEntity?)?.result?.lastSupportedVersion ??
  //             -1)) {
  //       emit(
  //         SplashState.needUpdateError(
  //           appLink:
  //               (result[1].data as AppUpdateEntity?)?.result?.appLink ?? '',
  //         ),
  //       );
  //     } else {
  //       emit(
  //         SplashState.loaded(
  //           customersTypes: [],
  //           checkAppVersion: int.parse(AppConfig().buildNumber!) <
  //                   ((result[1].data as AppUpdateEntity?)
  //                           ?.result
  //                           ?.lastVersion ??
  //                       -1)
  //               ? result[1].data as AppUpdateEntity?
  //               : null,
  //         ),
  //       );
  //     }
  //   }
  // }
}
