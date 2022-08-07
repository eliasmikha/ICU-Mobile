import '../../../domain/usecase/add_department_usecase.dart';
import '../../../data/request/param/add_department_param.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../core/errors/app_errors.dart';

part 'department_state.dart';

part 'department_cubit.freezed.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit() : super(const DepartmentState.departmentInit());

	void addDepartment(AddDepartmentParam param) async {
		emit(const DepartmentState.departmentLoading());

		final result = await getIt<AddDepartmentUsecase>()(param);

		result.pick(
			onData: (data) {
				emit(const DepartmentState.successAddDepartment());
			},
			onError: (error) {
				emit(DepartmentState.departmentError(error, () => addDepartment(param)));
			},
		);
	}
}
