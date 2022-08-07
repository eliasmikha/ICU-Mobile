import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../core/errors/app_errors.dart';

part 'more_state.dart';

part 'more_cubit.freezed.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(const MoreState.moreInit());
}
