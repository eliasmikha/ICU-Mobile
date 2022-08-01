// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'camera_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cameraInit,
    required TResult Function() cameraLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        cameraError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cameraInit,
    TResult Function()? cameraLoading,
    TResult Function(AppErrors error, VoidCallback callback)? cameraError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cameraInit,
    TResult Function()? cameraLoading,
    TResult Function(AppErrors error, VoidCallback callback)? cameraError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraInitState value) cameraInit,
    required TResult Function(CameraLoadingState value) cameraLoading,
    required TResult Function(CameraErrorState value) cameraError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CameraInitState value)? cameraInit,
    TResult Function(CameraLoadingState value)? cameraLoading,
    TResult Function(CameraErrorState value)? cameraError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraInitState value)? cameraInit,
    TResult Function(CameraLoadingState value)? cameraLoading,
    TResult Function(CameraErrorState value)? cameraError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CameraStateCopyWithImpl<$Res> implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  final CameraState _value;
  // ignore: unused_field
  final $Res Function(CameraState) _then;
}

/// @nodoc
abstract class _$$CameraInitStateCopyWith<$Res> {
  factory _$$CameraInitStateCopyWith(
          _$CameraInitState value, $Res Function(_$CameraInitState) then) =
      __$$CameraInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraInitStateCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res>
    implements _$$CameraInitStateCopyWith<$Res> {
  __$$CameraInitStateCopyWithImpl(
      _$CameraInitState _value, $Res Function(_$CameraInitState) _then)
      : super(_value, (v) => _then(v as _$CameraInitState));

  @override
  _$CameraInitState get _value => super._value as _$CameraInitState;
}

/// @nodoc

class _$CameraInitState implements CameraInitState {
  const _$CameraInitState();

  @override
  String toString() {
    return 'CameraState.cameraInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CameraInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cameraInit,
    required TResult Function() cameraLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        cameraError,
  }) {
    return cameraInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cameraInit,
    TResult Function()? cameraLoading,
    TResult Function(AppErrors error, VoidCallback callback)? cameraError,
  }) {
    return cameraInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cameraInit,
    TResult Function()? cameraLoading,
    TResult Function(AppErrors error, VoidCallback callback)? cameraError,
    required TResult orElse(),
  }) {
    if (cameraInit != null) {
      return cameraInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraInitState value) cameraInit,
    required TResult Function(CameraLoadingState value) cameraLoading,
    required TResult Function(CameraErrorState value) cameraError,
  }) {
    return cameraInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CameraInitState value)? cameraInit,
    TResult Function(CameraLoadingState value)? cameraLoading,
    TResult Function(CameraErrorState value)? cameraError,
  }) {
    return cameraInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraInitState value)? cameraInit,
    TResult Function(CameraLoadingState value)? cameraLoading,
    TResult Function(CameraErrorState value)? cameraError,
    required TResult orElse(),
  }) {
    if (cameraInit != null) {
      return cameraInit(this);
    }
    return orElse();
  }
}

abstract class CameraInitState implements CameraState {
  const factory CameraInitState() = _$CameraInitState;
}

/// @nodoc
abstract class _$$CameraLoadingStateCopyWith<$Res> {
  factory _$$CameraLoadingStateCopyWith(_$CameraLoadingState value,
          $Res Function(_$CameraLoadingState) then) =
      __$$CameraLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CameraLoadingStateCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res>
    implements _$$CameraLoadingStateCopyWith<$Res> {
  __$$CameraLoadingStateCopyWithImpl(
      _$CameraLoadingState _value, $Res Function(_$CameraLoadingState) _then)
      : super(_value, (v) => _then(v as _$CameraLoadingState));

  @override
  _$CameraLoadingState get _value => super._value as _$CameraLoadingState;
}

/// @nodoc

class _$CameraLoadingState implements CameraLoadingState {
  const _$CameraLoadingState();

  @override
  String toString() {
    return 'CameraState.cameraLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CameraLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cameraInit,
    required TResult Function() cameraLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        cameraError,
  }) {
    return cameraLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cameraInit,
    TResult Function()? cameraLoading,
    TResult Function(AppErrors error, VoidCallback callback)? cameraError,
  }) {
    return cameraLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cameraInit,
    TResult Function()? cameraLoading,
    TResult Function(AppErrors error, VoidCallback callback)? cameraError,
    required TResult orElse(),
  }) {
    if (cameraLoading != null) {
      return cameraLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraInitState value) cameraInit,
    required TResult Function(CameraLoadingState value) cameraLoading,
    required TResult Function(CameraErrorState value) cameraError,
  }) {
    return cameraLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CameraInitState value)? cameraInit,
    TResult Function(CameraLoadingState value)? cameraLoading,
    TResult Function(CameraErrorState value)? cameraError,
  }) {
    return cameraLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraInitState value)? cameraInit,
    TResult Function(CameraLoadingState value)? cameraLoading,
    TResult Function(CameraErrorState value)? cameraError,
    required TResult orElse(),
  }) {
    if (cameraLoading != null) {
      return cameraLoading(this);
    }
    return orElse();
  }
}

abstract class CameraLoadingState implements CameraState {
  const factory CameraLoadingState() = _$CameraLoadingState;
}

/// @nodoc
abstract class _$$CameraErrorStateCopyWith<$Res> {
  factory _$$CameraErrorStateCopyWith(
          _$CameraErrorState value, $Res Function(_$CameraErrorState) then) =
      __$$CameraErrorStateCopyWithImpl<$Res>;
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$CameraErrorStateCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res>
    implements _$$CameraErrorStateCopyWith<$Res> {
  __$$CameraErrorStateCopyWithImpl(
      _$CameraErrorState _value, $Res Function(_$CameraErrorState) _then)
      : super(_value, (v) => _then(v as _$CameraErrorState));

  @override
  _$CameraErrorState get _value => super._value as _$CameraErrorState;

  @override
  $Res call({
    Object? error = freezed,
    Object? callback = freezed,
  }) {
    return _then(_$CameraErrorState(
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

class _$CameraErrorState implements CameraErrorState {
  const _$CameraErrorState(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'CameraState.cameraError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraErrorState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), callback);

  @JsonKey(ignore: true)
  @override
  _$$CameraErrorStateCopyWith<_$CameraErrorState> get copyWith =>
      __$$CameraErrorStateCopyWithImpl<_$CameraErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cameraInit,
    required TResult Function() cameraLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        cameraError,
  }) {
    return cameraError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cameraInit,
    TResult Function()? cameraLoading,
    TResult Function(AppErrors error, VoidCallback callback)? cameraError,
  }) {
    return cameraError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cameraInit,
    TResult Function()? cameraLoading,
    TResult Function(AppErrors error, VoidCallback callback)? cameraError,
    required TResult orElse(),
  }) {
    if (cameraError != null) {
      return cameraError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraInitState value) cameraInit,
    required TResult Function(CameraLoadingState value) cameraLoading,
    required TResult Function(CameraErrorState value) cameraError,
  }) {
    return cameraError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CameraInitState value)? cameraInit,
    TResult Function(CameraLoadingState value)? cameraLoading,
    TResult Function(CameraErrorState value)? cameraError,
  }) {
    return cameraError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraInitState value)? cameraInit,
    TResult Function(CameraLoadingState value)? cameraLoading,
    TResult Function(CameraErrorState value)? cameraError,
    required TResult orElse(),
  }) {
    if (cameraError != null) {
      return cameraError(this);
    }
    return orElse();
  }
}

abstract class CameraErrorState implements CameraState {
  const factory CameraErrorState(
      final AppErrors error, final VoidCallback callback) = _$CameraErrorState;

  AppErrors get error => throw _privateConstructorUsedError;
  VoidCallback get callback => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$CameraErrorStateCopyWith<_$CameraErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
