part of 'room_cubit.dart';

@freezed
class RoomState with _$RoomState {
  const factory RoomState.roomInit() = RoomInitState;

  const factory RoomState.roomLoading() = RoomLoadingState;

  const factory RoomState.roomError(
    AppErrors error,
    VoidCallback callback,
  ) = RoomErrorState;
}
