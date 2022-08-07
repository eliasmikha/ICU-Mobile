// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'branch_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BranchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() branchInit,
    required TResult Function() branchLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        branchError,
    required TResult Function(BranchListEntity branchEntity) branchListLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BranchInitState value) branchInit,
    required TResult Function(BranchLoadingState value) branchLoading,
    required TResult Function(BranchErrorState value) branchError,
    required TResult Function(BranchListLoadedState value) branchListLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchStateCopyWith<$Res> {
  factory $BranchStateCopyWith(
          BranchState value, $Res Function(BranchState) then) =
      _$BranchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BranchStateCopyWithImpl<$Res> implements $BranchStateCopyWith<$Res> {
  _$BranchStateCopyWithImpl(this._value, this._then);

  final BranchState _value;
  // ignore: unused_field
  final $Res Function(BranchState) _then;
}

/// @nodoc
abstract class _$$BranchInitStateCopyWith<$Res> {
  factory _$$BranchInitStateCopyWith(
          _$BranchInitState value, $Res Function(_$BranchInitState) then) =
      __$$BranchInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BranchInitStateCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res>
    implements _$$BranchInitStateCopyWith<$Res> {
  __$$BranchInitStateCopyWithImpl(
      _$BranchInitState _value, $Res Function(_$BranchInitState) _then)
      : super(_value, (v) => _then(v as _$BranchInitState));

  @override
  _$BranchInitState get _value => super._value as _$BranchInitState;
}

/// @nodoc

class _$BranchInitState implements BranchInitState {
  const _$BranchInitState();

  @override
  String toString() {
    return 'BranchState.branchInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BranchInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() branchInit,
    required TResult Function() branchLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        branchError,
    required TResult Function(BranchListEntity branchEntity) branchListLoaded,
  }) {
    return branchInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
  }) {
    return branchInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
    required TResult orElse(),
  }) {
    if (branchInit != null) {
      return branchInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BranchInitState value) branchInit,
    required TResult Function(BranchLoadingState value) branchLoading,
    required TResult Function(BranchErrorState value) branchError,
    required TResult Function(BranchListLoadedState value) branchListLoaded,
  }) {
    return branchInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
  }) {
    return branchInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
    required TResult orElse(),
  }) {
    if (branchInit != null) {
      return branchInit(this);
    }
    return orElse();
  }
}

abstract class BranchInitState implements BranchState {
  const factory BranchInitState() = _$BranchInitState;
}

/// @nodoc
abstract class _$$BranchLoadingStateCopyWith<$Res> {
  factory _$$BranchLoadingStateCopyWith(_$BranchLoadingState value,
          $Res Function(_$BranchLoadingState) then) =
      __$$BranchLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BranchLoadingStateCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res>
    implements _$$BranchLoadingStateCopyWith<$Res> {
  __$$BranchLoadingStateCopyWithImpl(
      _$BranchLoadingState _value, $Res Function(_$BranchLoadingState) _then)
      : super(_value, (v) => _then(v as _$BranchLoadingState));

  @override
  _$BranchLoadingState get _value => super._value as _$BranchLoadingState;
}

/// @nodoc

class _$BranchLoadingState implements BranchLoadingState {
  const _$BranchLoadingState();

  @override
  String toString() {
    return 'BranchState.branchLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BranchLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() branchInit,
    required TResult Function() branchLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        branchError,
    required TResult Function(BranchListEntity branchEntity) branchListLoaded,
  }) {
    return branchLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
  }) {
    return branchLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
    required TResult orElse(),
  }) {
    if (branchLoading != null) {
      return branchLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BranchInitState value) branchInit,
    required TResult Function(BranchLoadingState value) branchLoading,
    required TResult Function(BranchErrorState value) branchError,
    required TResult Function(BranchListLoadedState value) branchListLoaded,
  }) {
    return branchLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
  }) {
    return branchLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
    required TResult orElse(),
  }) {
    if (branchLoading != null) {
      return branchLoading(this);
    }
    return orElse();
  }
}

abstract class BranchLoadingState implements BranchState {
  const factory BranchLoadingState() = _$BranchLoadingState;
}

/// @nodoc
abstract class _$$BranchErrorStateCopyWith<$Res> {
  factory _$$BranchErrorStateCopyWith(
          _$BranchErrorState value, $Res Function(_$BranchErrorState) then) =
      __$$BranchErrorStateCopyWithImpl<$Res>;
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$BranchErrorStateCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res>
    implements _$$BranchErrorStateCopyWith<$Res> {
  __$$BranchErrorStateCopyWithImpl(
      _$BranchErrorState _value, $Res Function(_$BranchErrorState) _then)
      : super(_value, (v) => _then(v as _$BranchErrorState));

  @override
  _$BranchErrorState get _value => super._value as _$BranchErrorState;

  @override
  $Res call({
    Object? error = freezed,
    Object? callback = freezed,
  }) {
    return _then(_$BranchErrorState(
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

class _$BranchErrorState implements BranchErrorState {
  const _$BranchErrorState(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'BranchState.branchError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchErrorState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), callback);

  @JsonKey(ignore: true)
  @override
  _$$BranchErrorStateCopyWith<_$BranchErrorState> get copyWith =>
      __$$BranchErrorStateCopyWithImpl<_$BranchErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() branchInit,
    required TResult Function() branchLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        branchError,
    required TResult Function(BranchListEntity branchEntity) branchListLoaded,
  }) {
    return branchError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
  }) {
    return branchError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
    required TResult orElse(),
  }) {
    if (branchError != null) {
      return branchError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BranchInitState value) branchInit,
    required TResult Function(BranchLoadingState value) branchLoading,
    required TResult Function(BranchErrorState value) branchError,
    required TResult Function(BranchListLoadedState value) branchListLoaded,
  }) {
    return branchError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
  }) {
    return branchError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
    required TResult orElse(),
  }) {
    if (branchError != null) {
      return branchError(this);
    }
    return orElse();
  }
}

abstract class BranchErrorState implements BranchState {
  const factory BranchErrorState(
      final AppErrors error, final VoidCallback callback) = _$BranchErrorState;

  AppErrors get error => throw _privateConstructorUsedError;
  VoidCallback get callback => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$BranchErrorStateCopyWith<_$BranchErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BranchListLoadedStateCopyWith<$Res> {
  factory _$$BranchListLoadedStateCopyWith(_$BranchListLoadedState value,
          $Res Function(_$BranchListLoadedState) then) =
      __$$BranchListLoadedStateCopyWithImpl<$Res>;
  $Res call({BranchListEntity branchEntity});
}

/// @nodoc
class __$$BranchListLoadedStateCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res>
    implements _$$BranchListLoadedStateCopyWith<$Res> {
  __$$BranchListLoadedStateCopyWithImpl(_$BranchListLoadedState _value,
      $Res Function(_$BranchListLoadedState) _then)
      : super(_value, (v) => _then(v as _$BranchListLoadedState));

  @override
  _$BranchListLoadedState get _value => super._value as _$BranchListLoadedState;

  @override
  $Res call({
    Object? branchEntity = freezed,
  }) {
    return _then(_$BranchListLoadedState(
      branchEntity == freezed
          ? _value.branchEntity
          : branchEntity // ignore: cast_nullable_to_non_nullable
              as BranchListEntity,
    ));
  }
}

/// @nodoc

class _$BranchListLoadedState implements BranchListLoadedState {
  const _$BranchListLoadedState(this.branchEntity);

  @override
  final BranchListEntity branchEntity;

  @override
  String toString() {
    return 'BranchState.branchListLoaded(branchEntity: $branchEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchListLoadedState &&
            const DeepCollectionEquality()
                .equals(other.branchEntity, branchEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(branchEntity));

  @JsonKey(ignore: true)
  @override
  _$$BranchListLoadedStateCopyWith<_$BranchListLoadedState> get copyWith =>
      __$$BranchListLoadedStateCopyWithImpl<_$BranchListLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() branchInit,
    required TResult Function() branchLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        branchError,
    required TResult Function(BranchListEntity branchEntity) branchListLoaded,
  }) {
    return branchListLoaded(branchEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
  }) {
    return branchListLoaded?.call(branchEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? branchInit,
    TResult Function()? branchLoading,
    TResult Function(AppErrors error, VoidCallback callback)? branchError,
    TResult Function(BranchListEntity branchEntity)? branchListLoaded,
    required TResult orElse(),
  }) {
    if (branchListLoaded != null) {
      return branchListLoaded(branchEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BranchInitState value) branchInit,
    required TResult Function(BranchLoadingState value) branchLoading,
    required TResult Function(BranchErrorState value) branchError,
    required TResult Function(BranchListLoadedState value) branchListLoaded,
  }) {
    return branchListLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
  }) {
    return branchListLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BranchInitState value)? branchInit,
    TResult Function(BranchLoadingState value)? branchLoading,
    TResult Function(BranchErrorState value)? branchError,
    TResult Function(BranchListLoadedState value)? branchListLoaded,
    required TResult orElse(),
  }) {
    if (branchListLoaded != null) {
      return branchListLoaded(this);
    }
    return orElse();
  }
}

abstract class BranchListLoadedState implements BranchState {
  const factory BranchListLoadedState(final BranchListEntity branchEntity) =
      _$BranchListLoadedState;

  BranchListEntity get branchEntity => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$BranchListLoadedStateCopyWith<_$BranchListLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
