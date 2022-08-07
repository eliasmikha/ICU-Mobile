import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../core/errors/app_errors.dart';

part 'department_state.dart';

part 'department_cubit.freezed.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(const DepartmentState.departmentInit());
}
