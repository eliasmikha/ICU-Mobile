// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'persons_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PersonsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() personsInit,
    required TResult Function() personsLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        personsError,
    required TResult Function() successAddPerson,
    required TResult Function(PersonsListEntity personsEntity)
        personsListLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonsInitState value) personsInit,
    required TResult Function(PersonsLoadingState value) personsLoading,
    required TResult Function(PersonsErrorState value) personsError,
    required TResult Function(SuccessAddPersonState value) successAddPerson,
    required TResult Function(PersonsListLoadedState value) personsListLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonsStateCopyWith<$Res> {
  factory $PersonsStateCopyWith(
          PersonsState value, $Res Function(PersonsState) then) =
      _$PersonsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PersonsStateCopyWithImpl<$Res> implements $PersonsStateCopyWith<$Res> {
  _$PersonsStateCopyWithImpl(this._value, this._then);

  final PersonsState _value;
  // ignore: unused_field
  final $Res Function(PersonsState) _then;
}

/// @nodoc
abstract class _$$PersonsInitStateCopyWith<$Res> {
  factory _$$PersonsInitStateCopyWith(
          _$PersonsInitState value, $Res Function(_$PersonsInitState) then) =
      __$$PersonsInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PersonsInitStateCopyWithImpl<$Res>
    extends _$PersonsStateCopyWithImpl<$Res>
    implements _$$PersonsInitStateCopyWith<$Res> {
  __$$PersonsInitStateCopyWithImpl(
      _$PersonsInitState _value, $Res Function(_$PersonsInitState) _then)
      : super(_value, (v) => _then(v as _$PersonsInitState));

  @override
  _$PersonsInitState get _value => super._value as _$PersonsInitState;
}

/// @nodoc

class _$PersonsInitState implements PersonsInitState {
  const _$PersonsInitState();

  @override
  String toString() {
    return 'PersonsState.personsInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PersonsInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() personsInit,
    required TResult Function() personsLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        personsError,
    required TResult Function() successAddPerson,
    required TResult Function(PersonsListEntity personsEntity)
        personsListLoaded,
  }) {
    return personsInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
  }) {
    return personsInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (personsInit != null) {
      return personsInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonsInitState value) personsInit,
    required TResult Function(PersonsLoadingState value) personsLoading,
    required TResult Function(PersonsErrorState value) personsError,
    required TResult Function(SuccessAddPersonState value) successAddPerson,
    required TResult Function(PersonsListLoadedState value) personsListLoaded,
  }) {
    return personsInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
  }) {
    return personsInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (personsInit != null) {
      return personsInit(this);
    }
    return orElse();
  }
}

abstract class PersonsInitState implements PersonsState {
  const factory PersonsInitState() = _$PersonsInitState;
}

/// @nodoc
abstract class _$$PersonsLoadingStateCopyWith<$Res> {
  factory _$$PersonsLoadingStateCopyWith(_$PersonsLoadingState value,
          $Res Function(_$PersonsLoadingState) then) =
      __$$PersonsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PersonsLoadingStateCopyWithImpl<$Res>
    extends _$PersonsStateCopyWithImpl<$Res>
    implements _$$PersonsLoadingStateCopyWith<$Res> {
  __$$PersonsLoadingStateCopyWithImpl(
      _$PersonsLoadingState _value, $Res Function(_$PersonsLoadingState) _then)
      : super(_value, (v) => _then(v as _$PersonsLoadingState));

  @override
  _$PersonsLoadingState get _value => super._value as _$PersonsLoadingState;
}

/// @nodoc

class _$PersonsLoadingState implements PersonsLoadingState {
  const _$PersonsLoadingState();

  @override
  String toString() {
    return 'PersonsState.personsLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PersonsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() personsInit,
    required TResult Function() personsLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        personsError,
    required TResult Function() successAddPerson,
    required TResult Function(PersonsListEntity personsEntity)
        personsListLoaded,
  }) {
    return personsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
  }) {
    return personsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (personsLoading != null) {
      return personsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonsInitState value) personsInit,
    required TResult Function(PersonsLoadingState value) personsLoading,
    required TResult Function(PersonsErrorState value) personsError,
    required TResult Function(SuccessAddPersonState value) successAddPerson,
    required TResult Function(PersonsListLoadedState value) personsListLoaded,
  }) {
    return personsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
  }) {
    return personsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (personsLoading != null) {
      return personsLoading(this);
    }
    return orElse();
  }
}

abstract class PersonsLoadingState implements PersonsState {
  const factory PersonsLoadingState() = _$PersonsLoadingState;
}

/// @nodoc
abstract class _$$PersonsErrorStateCopyWith<$Res> {
  factory _$$PersonsErrorStateCopyWith(
          _$PersonsErrorState value, $Res Function(_$PersonsErrorState) then) =
      __$$PersonsErrorStateCopyWithImpl<$Res>;
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$PersonsErrorStateCopyWithImpl<$Res>
    extends _$PersonsStateCopyWithImpl<$Res>
    implements _$$PersonsErrorStateCopyWith<$Res> {
  __$$PersonsErrorStateCopyWithImpl(
      _$PersonsErrorState _value, $Res Function(_$PersonsErrorState) _then)
      : super(_value, (v) => _then(v as _$PersonsErrorState));

  @override
  _$PersonsErrorState get _value => super._value as _$PersonsErrorState;

  @override
  $Res call({
    Object? error = freezed,
    Object? callback = freezed,
  }) {
    return _then(_$PersonsErrorState(
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

class _$PersonsErrorState implements PersonsErrorState {
  const _$PersonsErrorState(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'PersonsState.personsError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonsErrorState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), callback);

  @JsonKey(ignore: true)
  @override
  _$$PersonsErrorStateCopyWith<_$PersonsErrorState> get copyWith =>
      __$$PersonsErrorStateCopyWithImpl<_$PersonsErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() personsInit,
    required TResult Function() personsLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        personsError,
    required TResult Function() successAddPerson,
    required TResult Function(PersonsListEntity personsEntity)
        personsListLoaded,
  }) {
    return personsError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
  }) {
    return personsError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (personsError != null) {
      return personsError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonsInitState value) personsInit,
    required TResult Function(PersonsLoadingState value) personsLoading,
    required TResult Function(PersonsErrorState value) personsError,
    required TResult Function(SuccessAddPersonState value) successAddPerson,
    required TResult Function(PersonsListLoadedState value) personsListLoaded,
  }) {
    return personsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
  }) {
    return personsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (personsError != null) {
      return personsError(this);
    }
    return orElse();
  }
}

abstract class PersonsErrorState implements PersonsState {
  const factory PersonsErrorState(
      final AppErrors error, final VoidCallback callback) = _$PersonsErrorState;

  AppErrors get error => throw _privateConstructorUsedError;
  VoidCallback get callback => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PersonsErrorStateCopyWith<_$PersonsErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessAddPersonStateCopyWith<$Res> {
  factory _$$SuccessAddPersonStateCopyWith(_$SuccessAddPersonState value,
          $Res Function(_$SuccessAddPersonState) then) =
      __$$SuccessAddPersonStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessAddPersonStateCopyWithImpl<$Res>
    extends _$PersonsStateCopyWithImpl<$Res>
    implements _$$SuccessAddPersonStateCopyWith<$Res> {
  __$$SuccessAddPersonStateCopyWithImpl(_$SuccessAddPersonState _value,
      $Res Function(_$SuccessAddPersonState) _then)
      : super(_value, (v) => _then(v as _$SuccessAddPersonState));

  @override
  _$SuccessAddPersonState get _value => super._value as _$SuccessAddPersonState;
}

/// @nodoc

class _$SuccessAddPersonState implements SuccessAddPersonState {
  const _$SuccessAddPersonState();

  @override
  String toString() {
    return 'PersonsState.successAddPerson()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessAddPersonState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() personsInit,
    required TResult Function() personsLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        personsError,
    required TResult Function() successAddPerson,
    required TResult Function(PersonsListEntity personsEntity)
        personsListLoaded,
  }) {
    return successAddPerson();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
  }) {
    return successAddPerson?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (successAddPerson != null) {
      return successAddPerson();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonsInitState value) personsInit,
    required TResult Function(PersonsLoadingState value) personsLoading,
    required TResult Function(PersonsErrorState value) personsError,
    required TResult Function(SuccessAddPersonState value) successAddPerson,
    required TResult Function(PersonsListLoadedState value) personsListLoaded,
  }) {
    return successAddPerson(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
  }) {
    return successAddPerson?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (successAddPerson != null) {
      return successAddPerson(this);
    }
    return orElse();
  }
}

abstract class SuccessAddPersonState implements PersonsState {
  const factory SuccessAddPersonState() = _$SuccessAddPersonState;
}

/// @nodoc
abstract class _$$PersonsListLoadedStateCopyWith<$Res> {
  factory _$$PersonsListLoadedStateCopyWith(_$PersonsListLoadedState value,
          $Res Function(_$PersonsListLoadedState) then) =
      __$$PersonsListLoadedStateCopyWithImpl<$Res>;
  $Res call({PersonsListEntity personsEntity});
}

/// @nodoc
class __$$PersonsListLoadedStateCopyWithImpl<$Res>
    extends _$PersonsStateCopyWithImpl<$Res>
    implements _$$PersonsListLoadedStateCopyWith<$Res> {
  __$$PersonsListLoadedStateCopyWithImpl(_$PersonsListLoadedState _value,
      $Res Function(_$PersonsListLoadedState) _then)
      : super(_value, (v) => _then(v as _$PersonsListLoadedState));

  @override
  _$PersonsListLoadedState get _value =>
      super._value as _$PersonsListLoadedState;

  @override
  $Res call({
    Object? personsEntity = freezed,
  }) {
    return _then(_$PersonsListLoadedState(
      personsEntity == freezed
          ? _value.personsEntity
          : personsEntity // ignore: cast_nullable_to_non_nullable
              as PersonsListEntity,
    ));
  }
}

/// @nodoc

class _$PersonsListLoadedState implements PersonsListLoadedState {
  const _$PersonsListLoadedState(this.personsEntity);

  @override
  final PersonsListEntity personsEntity;

  @override
  String toString() {
    return 'PersonsState.personsListLoaded(personsEntity: $personsEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonsListLoadedState &&
            const DeepCollectionEquality()
                .equals(other.personsEntity, personsEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(personsEntity));

  @JsonKey(ignore: true)
  @override
  _$$PersonsListLoadedStateCopyWith<_$PersonsListLoadedState> get copyWith =>
      __$$PersonsListLoadedStateCopyWithImpl<_$PersonsListLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() personsInit,
    required TResult Function() personsLoading,
    required TResult Function(AppErrors error, VoidCallback callback)
        personsError,
    required TResult Function() successAddPerson,
    required TResult Function(PersonsListEntity personsEntity)
        personsListLoaded,
  }) {
    return personsListLoaded(personsEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
  }) {
    return personsListLoaded?.call(personsEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? personsInit,
    TResult Function()? personsLoading,
    TResult Function(AppErrors error, VoidCallback callback)? personsError,
    TResult Function()? successAddPerson,
    TResult Function(PersonsListEntity personsEntity)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (personsListLoaded != null) {
      return personsListLoaded(personsEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonsInitState value) personsInit,
    required TResult Function(PersonsLoadingState value) personsLoading,
    required TResult Function(PersonsErrorState value) personsError,
    required TResult Function(SuccessAddPersonState value) successAddPerson,
    required TResult Function(PersonsListLoadedState value) personsListLoaded,
  }) {
    return personsListLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
  }) {
    return personsListLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonsInitState value)? personsInit,
    TResult Function(PersonsLoadingState value)? personsLoading,
    TResult Function(PersonsErrorState value)? personsError,
    TResult Function(SuccessAddPersonState value)? successAddPerson,
    TResult Function(PersonsListLoadedState value)? personsListLoaded,
    required TResult orElse(),
  }) {
    if (personsListLoaded != null) {
      return personsListLoaded(this);
    }
    return orElse();
  }
}

abstract class PersonsListLoadedState implements PersonsState {
  const factory PersonsListLoadedState(final PersonsListEntity personsEntity) =
      _$PersonsListLoadedState;

  PersonsListEntity get personsEntity => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PersonsListLoadedStateCopyWith<_$PersonsListLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
