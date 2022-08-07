import '../../../domain/usecase/add_room_usecase.dart';
import '../../../data/request/param/add_room_param.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../di/service_locator.dart';
import '../../../../../core/errors/app_errors.dart';

part 'room_state.dart';

part 'room_cubit.freezed.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(const RoomState.roomInit());

	void addRoom(AddRoomParam param) async {
		emit(const RoomState.roomLoading());

		final result = await getIt<AddRoomUsecase>()(param);

		result.pick(
			onData: (data) {
				emit(const RoomState.successAddRoom());
			},
			onError: (error) {
				emit(RoomState.roomError(error, () => addRoom(param)));
			},
		);
	}
}
