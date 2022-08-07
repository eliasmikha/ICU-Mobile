import 'package:starter_application/core/params/id_param.dart';

import '../../../domain/usecase/get_persons_list_usecase.dart';
import '../../../domain/entity/persons_list_entity.dart';
import '../../../domain/usecase/add_person_usecase.dart';
import '../../../data/request/param/add_person_param.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../core/errors/app_errors.dart';

part 'persons_state.dart';

part 'persons_cubit.freezed.dart';

class PersonsCubit extends Cubit<PersonsState> {
  PersonsCubit() : super(const PersonsState.personsInit());

	void addPerson(AddPersonParam param) async {
		emit(const PersonsState.personsLoading());

		final result = await getIt<AddPersonUsecase>()(param);

		result.pick(
			onData: (data) {
				emit(const PersonsState.successAddPerson());
			},
			onError: (error) {
				emit(PersonsState.personsError(error, () => addPerson(param)));
			},
		);
	}

	void getPersonsList(IdParam param) async {
		emit(const PersonsState.personsLoading());

		final result = await getIt<GetPersonsListUsecase>()(param);

		result.pick(
			onData: (data) {
				emit(PersonsState.personsListLoaded(data));
			},
			onError: (error) {
				emit(PersonsState.personsError(error, () => getPersonsList(param)));
			},
		);
	}
}
