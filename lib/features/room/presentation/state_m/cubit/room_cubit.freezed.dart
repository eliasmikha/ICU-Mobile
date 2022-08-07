// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'room_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roomInit,
    required TResult Function() roomLoading,
    required TResult Function(AppErrors error, VoidCallback callback) roomError,
    required TResult Function() successAddRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomInitState value) roomInit,
    required TResult Function(RoomLoadingState value) roomLoading,
    required TResult Function(RoomErrorState value) roomError,
    required TResult Function(SuccessAddRoomState value) successAddRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res> implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  final RoomState _value;
  // ignore: unused_field
  final $Res Function(RoomState) _then;
}

/// @nodoc
abstract class _$$RoomInitStateCopyWith<$Res> {
  factory _$$RoomInitStateCopyWith(
          _$RoomInitState value, $Res Function(_$RoomInitState) then) =
      __$$RoomInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RoomInitStateCopyWithImpl<$Res> extends _$RoomStateCopyWithImpl<$Res>
    implements _$$RoomInitStateCopyWith<$Res> {
  __$$RoomInitStateCopyWithImpl(
      _$RoomInitState _value, $Res Function(_$RoomInitState) _then)
      : super(_value, (v) => _then(v as _$RoomInitState));

  @override
  _$RoomInitState get _value => super._value as _$RoomInitState;
}

/// @nodoc

class _$RoomInitState implements RoomInitState {
  const _$RoomInitState();

  @override
  String toString() {
    return 'RoomState.roomInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RoomInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roomInit,
    required TResult Function() roomLoading,
    required TResult Function(AppErrors error, VoidCallback callback) roomError,
    required TResult Function() successAddRoom,
  }) {
    return roomInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
  }) {
    return roomInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
    required TResult orElse(),
  }) {
    if (roomInit != null) {
      return roomInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomInitState value) roomInit,
    required TResult Function(RoomLoadingState value) roomLoading,
    required TResult Function(RoomErrorState value) roomError,
    required TResult Function(SuccessAddRoomState value) successAddRoom,
  }) {
    return roomInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
  }) {
    return roomInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
    required TResult orElse(),
  }) {
    if (roomInit != null) {
      return roomInit(this);
    }
    return orElse();
  }
}

abstract class RoomInitState implements RoomState {
  const factory RoomInitState() = _$RoomInitState;
}

/// @nodoc
abstract class _$$RoomLoadingStateCopyWith<$Res> {
  factory _$$RoomLoadingStateCopyWith(
          _$RoomLoadingState value, $Res Function(_$RoomLoadingState) then) =
      __$$RoomLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RoomLoadingStateCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res>
    implements _$$RoomLoadingStateCopyWith<$Res> {
  __$$RoomLoadingStateCopyWithImpl(
      _$RoomLoadingState _value, $Res Function(_$RoomLoadingState) _then)
      : super(_value, (v) => _then(v as _$RoomLoadingState));

  @override
  _$RoomLoadingState get _value => super._value as _$RoomLoadingState;
}

/// @nodoc

class _$RoomLoadingState implements RoomLoadingState {
  const _$RoomLoadingState();

  @override
  String toString() {
    return 'RoomState.roomLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RoomLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roomInit,
    required TResult Function() roomLoading,
    required TResult Function(AppErrors error, VoidCallback callback) roomError,
    required TResult Function() successAddRoom,
  }) {
    return roomLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
  }) {
    return roomLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
    required TResult orElse(),
  }) {
    if (roomLoading != null) {
      return roomLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomInitState value) roomInit,
    required TResult Function(RoomLoadingState value) roomLoading,
    required TResult Function(RoomErrorState value) roomError,
    required TResult Function(SuccessAddRoomState value) successAddRoom,
  }) {
    return roomLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
  }) {
    return roomLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
    required TResult orElse(),
  }) {
    if (roomLoading != null) {
      return roomLoading(this);
    }
    return orElse();
  }
}

abstract class RoomLoadingState implements RoomState {
  const factory RoomLoadingState() = _$RoomLoadingState;
}

/// @nodoc
abstract class _$$RoomErrorStateCopyWith<$Res> {
  factory _$$RoomErrorStateCopyWith(
          _$RoomErrorState value, $Res Function(_$RoomErrorState) then) =
      __$$RoomErrorStateCopyWithImpl<$Res>;
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$RoomErrorStateCopyWithImpl<$Res> extends _$RoomStateCopyWithImpl<$Res>
    implements _$$RoomErrorStateCopyWith<$Res> {
  __$$RoomErrorStateCopyWithImpl(
      _$RoomErrorState _value, $Res Function(_$RoomErrorState) _then)
      : super(_value, (v) => _then(v as _$RoomErrorState));

  @override
  _$RoomErrorState get _value => super._value as _$RoomErrorState;

  @override
  $Res call({
    Object? error = freezed,
    Object? callback = freezed,
  }) {
    return _then(_$RoomErrorState(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrors,
      callback == freezed
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }

  @override
  $AppErrorsCopyWith<$Res> get error {
    return $AppErrorsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$RoomErrorState implements RoomErrorState {
  const _$RoomErrorState(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'RoomState.roomError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomErrorState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), callback);

  @JsonKey(ignore: true)
  @override
  _$$RoomErrorStateCopyWith<_$RoomErrorState> get copyWith =>
      __$$RoomErrorStateCopyWithImpl<_$RoomErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roomInit,
    required TResult Function() roomLoading,
    required TResult Function(AppErrors error, VoidCallback callback) roomError,
    required TResult Function() successAddRoom,
  }) {
    return roomError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
  }) {
    return roomError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
    required TResult orElse(),
  }) {
    if (roomError != null) {
      return roomError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomInitState value) roomInit,
    required TResult Function(RoomLoadingState value) roomLoading,
    required TResult Function(RoomErrorState value) roomError,
    required TResult Function(SuccessAddRoomState value) successAddRoom,
  }) {
    return roomError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
  }) {
    return roomError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
    required TResult orElse(),
  }) {
    if (roomError != null) {
      return roomError(this);
    }
    return orElse();
  }
}

abstract class RoomErrorState implements RoomState {
  const factory RoomErrorState(
      final AppErrors error, final VoidCallback callback) = _$RoomErrorState;

  AppErrors get error => throw _privateConstructorUsedError;
  VoidCallback get callback => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RoomErrorStateCopyWith<_$RoomErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessAddRoomStateCopyWith<$Res> {
  factory _$$SuccessAddRoomStateCopyWith(_$SuccessAddRoomState value,
          $Res Function(_$SuccessAddRoomState) then) =
      __$$SuccessAddRoomStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessAddRoomStateCopyWithImpl<$Res>
    extends _$RoomStateCopyWithImpl<$Res>
    implements _$$SuccessAddRoomStateCopyWith<$Res> {
  __$$SuccessAddRoomStateCopyWithImpl(
      _$SuccessAddRoomState _value, $Res Function(_$SuccessAddRoomState) _then)
      : super(_value, (v) => _then(v as _$SuccessAddRoomState));

  @override
  _$SuccessAddRoomState get _value => super._value as _$SuccessAddRoomState;
}

/// @nodoc

class _$SuccessAddRoomState implements SuccessAddRoomState {
  const _$SuccessAddRoomState();

  @override
  String toString() {
    return 'RoomState.successAddRoom()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessAddRoomState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() roomInit,
    required TResult Function() roomLoading,
    required TResult Function(AppErrors error, VoidCallback callback) roomError,
    required TResult Function() successAddRoom,
  }) {
    return successAddRoom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
  }) {
    return successAddRoom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? roomInit,
    TResult Function()? roomLoading,
    TResult Function(AppErrors error, VoidCallback callback)? roomError,
    TResult Function()? successAddRoom,
    required TResult orElse(),
  }) {
    if (successAddRoom != null) {
      return successAddRoom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomInitState value) roomInit,
    required TResult Function(RoomLoadingState value) roomLoading,
    required TResult Function(RoomErrorState value) roomError,
    required TResult Function(SuccessAddRoomState value) successAddRoom,
  }) {
    return successAddRoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
  }) {
    return successAddRoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomInitState value)? roomInit,
    TResult Function(RoomLoadingState value)? roomLoading,
    TResult Function(RoomErrorState value)? roomError,
    TResult Function(SuccessAddRoomState value)? successAddRoom,
    required TResult orElse(),
  }) {
    if (successAddRoom != null) {
      return successAddRoom(this);
    }
    return orElse();
  }
}

abstract class SuccessAddRoomState implements RoomState {
  const factory SuccessAddRoomState() = _$SuccessAddRoomState;
}
