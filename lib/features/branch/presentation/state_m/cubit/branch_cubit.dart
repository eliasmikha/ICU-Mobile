import 'package:starter_application/core/params/id_param.dart';

import '../../../domain/usecase/get_branches_list_usecase.dart';
import '../../../domain/entity/branch_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../core/errors/app_errors.dart';

part 'branch_state.dart';

part 'branch_cubit.freezed.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(const BranchState.branchInit());

	void getBranchesList(IdParam param) async {
		emit(const BranchState.branchLoading());

		final result = await getIt<GetBranchesListUsecase>()(param);

		result.pick(
			onData: (data) {
				emit(BranchState.branchListLoaded(data));
			},
			onError: (error) {
				emit(BranchState.branchError(error, () => getBranchesList(param)));
			},
		);
	}
}
