// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitial,
    required TResult Function() mapLoading,
    required TResult Function(MapDistanceModel mapDistanceResult)
        mapDistanceLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) mapError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapInitial value) mapInitial,
    required TResult Function(MapLoading value) mapLoading,
    required TResult Function(MapDistanceLoaded value) mapDistanceLoaded,
    required TResult Function(MapError value) mapError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res> implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  final MapState _value;
  // ignore: unused_field
  final $Res Function(MapState) _then;
}

/// @nodoc
abstract class _$$MapInitialCopyWith<$Res> {
  factory _$$MapInitialCopyWith(
          _$MapInitial value, $Res Function(_$MapInitial) then) =
      __$$MapInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapInitialCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements _$$MapInitialCopyWith<$Res> {
  __$$MapInitialCopyWithImpl(
      _$MapInitial _value, $Res Function(_$MapInitial) _then)
      : super(_value, (v) => _then(v as _$MapInitial));

  @override
  _$MapInitial get _value => super._value as _$MapInitial;
}

/// @nodoc

class _$MapInitial implements MapInitial {
  const _$MapInitial();

  @override
  String toString() {
    return 'MapState.mapInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitial,
    required TResult Function() mapLoading,
    required TResult Function(MapDistanceModel mapDistanceResult)
        mapDistanceLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) mapError,
  }) {
    return mapInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
  }) {
    return mapInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
    required TResult orElse(),
  }) {
    if (mapInitial != null) {
      return mapInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapInitial value) mapInitial,
    required TResult Function(MapLoading value) mapLoading,
    required TResult Function(MapDistanceLoaded value) mapDistanceLoaded,
    required TResult Function(MapError value) mapError,
  }) {
    return mapInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
  }) {
    return mapInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
    required TResult orElse(),
  }) {
    if (mapInitial != null) {
      return mapInitial(this);
    }
    return orElse();
  }
}

abstract class MapInitial implements MapState {
  const factory MapInitial() = _$MapInitial;
}

/// @nodoc
abstract class _$$MapLoadingCopyWith<$Res> {
  factory _$$MapLoadingCopyWith(
          _$MapLoading value, $Res Function(_$MapLoading) then) =
      __$$MapLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapLoadingCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements _$$MapLoadingCopyWith<$Res> {
  __$$MapLoadingCopyWithImpl(
      _$MapLoading _value, $Res Function(_$MapLoading) _then)
      : super(_value, (v) => _then(v as _$MapLoading));

  @override
  _$MapLoading get _value => super._value as _$MapLoading;
}

/// @nodoc

class _$MapLoading implements MapLoading {
  const _$MapLoading();

  @override
  String toString() {
    return 'MapState.mapLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitial,
    required TResult Function() mapLoading,
    required TResult Function(MapDistanceModel mapDistanceResult)
        mapDistanceLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) mapError,
  }) {
    return mapLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
  }) {
    return mapLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
    required TResult orElse(),
  }) {
    if (mapLoading != null) {
      return mapLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapInitial value) mapInitial,
    required TResult Function(MapLoading value) mapLoading,
    required TResult Function(MapDistanceLoaded value) mapDistanceLoaded,
    required TResult Function(MapError value) mapError,
  }) {
    return mapLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
  }) {
    return mapLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
    required TResult orElse(),
  }) {
    if (mapLoading != null) {
      return mapLoading(this);
    }
    return orElse();
  }
}

abstract class MapLoading implements MapState {
  const factory MapLoading() = _$MapLoading;
}

/// @nodoc
abstract class _$$MapDistanceLoadedCopyWith<$Res> {
  factory _$$MapDistanceLoadedCopyWith(
          _$MapDistanceLoaded value, $Res Function(_$MapDistanceLoaded) then) =
      __$$MapDistanceLoadedCopyWithImpl<$Res>;
  $Res call({MapDistanceModel mapDistanceResult});
}

/// @nodoc
class __$$MapDistanceLoadedCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res>
    implements _$$MapDistanceLoadedCopyWith<$Res> {
  __$$MapDistanceLoadedCopyWithImpl(
      _$MapDistanceLoaded _value, $Res Function(_$MapDistanceLoaded) _then)
      : super(_value, (v) => _then(v as _$MapDistanceLoaded));

  @override
  _$MapDistanceLoaded get _value => super._value as _$MapDistanceLoaded;

  @override
  $Res call({
    Object? mapDistanceResult = freezed,
  }) {
    return _then(_$MapDistanceLoaded(
      mapDistanceResult: mapDistanceResult == freezed
          ? _value.mapDistanceResult
          : mapDistanceResult // ignore: cast_nullable_to_non_nullable
              as MapDistanceModel,
    ));
  }
}

/// @nodoc

class _$MapDistanceLoaded implements MapDistanceLoaded {
  const _$MapDistanceLoaded({required this.mapDistanceResult});

  @override
  final MapDistanceModel mapDistanceResult;

  @override
  String toString() {
    return 'MapState.mapDistanceLoaded(mapDistanceResult: $mapDistanceResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapDistanceLoaded &&
            const DeepCollectionEquality()
                .equals(other.mapDistanceResult, mapDistanceResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(mapDistanceResult));

  @JsonKey(ignore: true)
  @override
  _$$MapDistanceLoadedCopyWith<_$MapDistanceLoaded> get copyWith =>
      __$$MapDistanceLoadedCopyWithImpl<_$MapDistanceLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitial,
    required TResult Function() mapLoading,
    required TResult Function(MapDistanceModel mapDistanceResult)
        mapDistanceLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) mapError,
  }) {
    return mapDistanceLoaded(mapDistanceResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
  }) {
    return mapDistanceLoaded?.call(mapDistanceResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
    required TResult orElse(),
  }) {
    if (mapDistanceLoaded != null) {
      return mapDistanceLoaded(mapDistanceResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapInitial value) mapInitial,
    required TResult Function(MapLoading value) mapLoading,
    required TResult Function(MapDistanceLoaded value) mapDistanceLoaded,
    required TResult Function(MapError value) mapError,
  }) {
    return mapDistanceLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
  }) {
    return mapDistanceLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
    required TResult orElse(),
  }) {
    if (mapDistanceLoaded != null) {
      return mapDistanceLoaded(this);
    }
    return orElse();
  }
}

abstract class MapDistanceLoaded implements MapState {
  const factory MapDistanceLoaded(
          {required final MapDistanceModel mapDistanceResult}) =
      _$MapDistanceLoaded;

  MapDistanceModel get mapDistanceResult => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MapDistanceLoadedCopyWith<_$MapDistanceLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MapErrorCopyWith<$Res> {
  factory _$$MapErrorCopyWith(
          _$MapError value, $Res Function(_$MapError) then) =
      __$$MapErrorCopyWithImpl<$Res>;
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$MapErrorCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements _$$MapErrorCopyWith<$Res> {
  __$$MapErrorCopyWithImpl(_$MapError _value, $Res Function(_$MapError) _then)
      : super(_value, (v) => _then(v as _$MapError));

  @override
  _$MapError get _value => super._value as _$MapError;

  @override
  $Res call({
    Object? error = freezed,
    Object? callback = freezed,
  }) {
    return _then(_$MapError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrors,
      callback: callback == freezed
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

class _$MapError implements MapError {
  const _$MapError({required this.error, required this.callback});

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'MapState.mapError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), callback);

  @JsonKey(ignore: true)
  @override
  _$$MapErrorCopyWith<_$MapError> get copyWith =>
      __$$MapErrorCopyWithImpl<_$MapError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() mapInitial,
    required TResult Function() mapLoading,
    required TResult Function(MapDistanceModel mapDistanceResult)
        mapDistanceLoaded,
    required TResult Function(AppErrors error, VoidCallback callback) mapError,
  }) {
    return mapError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
  }) {
    return mapError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? mapInitial,
    TResult Function()? mapLoading,
    TResult Function(MapDistanceModel mapDistanceResult)? mapDistanceLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? mapError,
    required TResult orElse(),
  }) {
    if (mapError != null) {
      return mapError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapInitial value) mapInitial,
    required TResult Function(MapLoading value) mapLoading,
    required TResult Function(MapDistanceLoaded value) mapDistanceLoaded,
    required TResult Function(MapError value) mapError,
  }) {
    return mapError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
  }) {
    return mapError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapInitial value)? mapInitial,
    TResult Function(MapLoading value)? mapLoading,
    TResult Function(MapDistanceLoaded value)? mapDistanceLoaded,
    TResult Function(MapError value)? mapError,
    required TResult orElse(),
  }) {
    if (mapError != null) {
      return mapError(this);
    }
    return orElse();
  }
}

abstract class MapError implements MapState {
  const factory MapError(
      {required final AppErrors error,
      required final VoidCallback callback}) = _$MapError;

  AppErrors get error => throw _privateConstructorUsedError;
  VoidCallback get callback => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$MapErrorCopyWith<_$MapError> get copyWith =>
      throw _privateConstructorUsedError;
}
