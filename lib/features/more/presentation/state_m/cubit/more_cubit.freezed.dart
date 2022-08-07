// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'more_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoreState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() moreInit,
    required TResult Function() moreLoading,
    required TResult Function(AppErrors error, VoidCallback callback) moreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? moreInit,
    TResult Function()? moreLoading,
    TResult Function(AppErrors error, VoidCallback callback)? moreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? moreInit,
    TResult Function()? moreLoading,
    TResult Function(AppErrors error, VoidCallback callback)? moreError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoreInitState value) moreInit,
    required TResult Function(MoreLoadingState value) moreLoading,
    required TResult Function(MoreErrorState value) moreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MoreInitState value)? moreInit,
    TResult Function(MoreLoadingState value)? moreLoading,
    TResult Function(MoreErrorState value)? moreError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoreInitState value)? moreInit,
    TResult Function(MoreLoadingState value)? moreLoading,
    TResult Function(MoreErrorState value)? moreError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreStateCopyWith<$Res> {
  factory $MoreStateCopyWith(MoreState value, $Res Function(MoreState) then) =
      _$MoreStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MoreStateCopyWithImpl<$Res> implements $MoreStateCopyWith<$Res> {
  _$MoreStateCopyWithImpl(this._value, this._then);

  final MoreState _value;
  // ignore: unused_field
  final $Res Function(MoreState) _then;
}

/// @nodoc
abstract class _$$MoreInitStateCopyWith<$Res> {
  factory _$$MoreInitStateCopyWith(
          _$MoreInitState value, $Res Function(_$MoreInitState) then) =
      __$$MoreInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MoreInitStateCopyWithImpl<$Res> extends _$MoreStateCopyWithImpl<$Res>
    implements _$$MoreInitStateCopyWith<$Res> {
  __$$MoreInitStateCopyWithImpl(
      _$MoreInitState _value, $Res Function(_$MoreInitState) _then)
      : super(_value, (v) => _then(v as _$MoreInitState));

  @override
  _$MoreInitState get _value => super._value as _$MoreInitState;
}

/// @nodoc

class _$MoreInitState implements MoreInitState {
  const _$MoreInitState();

  @override
  String toString() {
    return 'MoreState.moreInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MoreInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() moreInit,
    required TResult Function() moreLoading,
    required TResult Function(AppErrors error, VoidCallback callback) moreError,
  }) {
    return moreInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? moreInit,
    TResult Function()? moreLoading,
    TResult Function(AppErrors error, VoidCallback callback)? moreError,
  }) {
    return moreInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? moreInit,
    TResult Function()? moreLoading,
    TResult Function(AppErrors error, VoidCallback callback)? moreError,
    required TResult orElse(),
  }) {
    if (moreInit != null) {
      return moreInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoreInitState value) moreInit,
    required TResult Function(MoreLoadingState value) moreLoading,
    required TResult Function(MoreErrorState value) moreError,
  }) {
    return moreInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MoreInitState value)? moreInit,
    TResult Function(MoreLoadingState value)? moreLoading,
    TResult Function(MoreErrorState value)? moreError,
  }) {
    return moreInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoreInitState value)? moreInit,
    TResult Function(MoreLoadingState value)? moreLoading,
    TResult Function(MoreErrorState value)? moreError,
    required TResult orElse(),
  }) {
    if (moreInit != null) {
      return moreInit(this);
    }
    return orElse();
  }
}

abstract class MoreInitState implements MoreState {
  const factory MoreInitState() = _$MoreInitState;
}

/// @nodoc
abstract class _$$MoreLoadingStateCopyWith<$Res> {
  factory _$$MoreLoadingStateCopyWith(
          _$MoreLoadingState value, $Res Function(_$MoreLoadingState) then) =
      __$$MoreLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MoreLoadingStateCopyWithImpl<$Res>
    extends _$MoreStateCopyWithImpl<$Res>
    implements _$$MoreLoadingStateCopyWith<$Res> {
  __$$MoreLoadingStateCopyWithImpl(
      _$MoreLoadingState _value, $Res Function(_$MoreLoadingState) _then)
      : super(_value, (v) => _then(v as _$MoreLoadingState));

  @override
  _$MoreLoadingState get _value => super._value as _$MoreLoadingState;
}

/// @nodoc

class _$MoreLoadingState implements MoreLoadingState {
  const _$MoreLoadingState();

  @override
  String toString() {
    return 'MoreState.moreLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MoreLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() moreInit,
    required TResult Function() moreLoading,
    required TResult Function(AppErrors error, VoidCallback callback) moreError,
  }) {
    return moreLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? moreInit,
    TResult Function()? moreLoading,
    TResult Function(AppErrors error, VoidCallback callback)? moreError,
  }) {
    return moreLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? moreInit,
    TResult Function()? moreLoading,
    TResult Function(AppErrors error, VoidCallback callback)? moreError,
    required TResult orElse(),
  }) {
    if (moreLoading != null) {
      return moreLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoreInitState value) moreInit,
    required TResult Function(MoreLoadingState value) moreLoading,
    required TResult Function(MoreErrorState value) moreError,
  }) {
    return moreLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MoreInitState value)? moreInit,
    TResult Function(MoreLoadingState value)? moreLoading,
    TResult Function(MoreErrorState value)? moreError,
  }) {
    return moreLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoreInitState value)? moreInit,
    TResult Function(MoreLoadingState value)? moreLoading,
    TResult Function(MoreErrorState value)? moreError,
    required TResult orElse(),
  }) {
    if (moreLoading != null) {
      return moreLoading(this);
    }
    return orElse();
  }
}

abstract class MoreLoadingState implements MoreState {
  const factory MoreLoadingState() = _$MoreLoadingState;
}

/// @nodoc
abstract class _$$MoreErrorStateCopyWith<$Res> {
  factory _$$MoreErrorStateCopyWith(
          _$MoreErrorState value, $Res Function(_$MoreErrorState) then) =
      __$$MoreErrorStateCopyWithImpl<$Res>;
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$MoreErrorStateCopyWithImpl<$Res> extends _$MoreStateCopyWithImpl<$Res>
    implements _$$MoreErrorStateCopyWith<$Res> {
  __$$MoreErrorStateCopyWithImpl(
      _$MoreErrorState _value, $Res Function(_$MoreErrorState) _then)
      : super(_value, (v) => _then(v as _$MoreErrorState));

  @override
  _$MoreErrorState get _value => super._value as _$MoreErrorState;

  @override
  $Res call({
    Object? error = freezed,
    Object? callback = freezed,
  }) {
    return _then(_$MoreErrorState(
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

class _$MoreErrorState implements MoreErrorState {
  const _$MoreErrorState(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'MoreState.moreError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoreErrorState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), callback);

  @JsonKey(ignore: true)
  @override
  _$$MoreErrorStateCopyWith<_$MoreErrorState> get copyWith =>
      __$$MoreErrorStateCopyWithImpl<_$MoreErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() moreInit,
    required TResult Function() moreLoading,
    required TResult Function(AppErrors error, VoidCallback callback) moreError,
  }) {
    return moreError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? moreInit,
    TResult Function()? moreLoading,
    TResult Function(AppErrors error, VoidCallback callback)? moreError,
  }) {
    return moreError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? moreInit,
    TResult Function()? moreLoading,
    TResult Function(AppErrors error, VoidCallback callback)? moreError,
    required TResult orElse(),
  }) {
    if (moreError != null) {
      return moreError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MoreInitState value) moreInit,
    required TResult Function(MoreLoadingState value) moreLoading,
    required TResult Function(MoreErrorState value) moreError,
  }) {
    return moreError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MoreInitState value)? moreInit,
    TResult Function(MoreLoadingState value)? moreLoading,
    TResult Function(MoreErrorState value)? moreError,
  }) {
    return moreError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MoreInitState value)? moreInit,
    TResult Function(MoreLoadingState value)? moreLoading,
    TResult Function(MoreErrorState value)? moreError,
    required TResult orElse(),
  }) {
    if (moreError != null) {
      return moreError(this);
    }
    return orElse();
  }
}

abstract class MoreErrorState implements MoreState {
  const factory MoreErrorState(
      final AppErrors error, final VoidCallback callback) = _$MoreErrorState;

  AppErrors get error => throw _privateConstructorUsedError;
  VoidCallback get callback => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MoreErrorStateCopyWith<_$MoreErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
