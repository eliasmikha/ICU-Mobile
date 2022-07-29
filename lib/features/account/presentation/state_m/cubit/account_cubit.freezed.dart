// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;
}

/// @nodoc
abstract class _$$AccountInitCopyWith<$Res> {
  factory _$$AccountInitCopyWith(
          _$AccountInit value, $Res Function(_$AccountInit) then) =
      __$$AccountInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountInitCopyWithImpl<$Res> extends _$AccountStateCopyWithImpl<$Res>
    implements _$$AccountInitCopyWith<$Res> {
  __$$AccountInitCopyWithImpl(
      _$AccountInit _value, $Res Function(_$AccountInit) _then)
      : super(_value, (v) => _then(v as _$AccountInit));

  @override
  _$AccountInit get _value => super._value as _$AccountInit;
}

/// @nodoc

class _$AccountInit implements AccountInit {
  const _$AccountInit();

  @override
  String toString() {
    return 'AccountState.accountInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return accountInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
  }) {
    return accountInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (accountInit != null) {
      return accountInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return accountInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
  }) {
    return accountInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (accountInit != null) {
      return accountInit(this);
    }
    return orElse();
  }
}

abstract class AccountInit implements AccountState {
  const factory AccountInit() = _$AccountInit;
}

/// @nodoc
abstract class _$$AccountLoadingCopyWith<$Res> {
  factory _$$AccountLoadingCopyWith(
          _$AccountLoading value, $Res Function(_$AccountLoading) then) =
      __$$AccountLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountLoadingCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$AccountLoadingCopyWith<$Res> {
  __$$AccountLoadingCopyWithImpl(
      _$AccountLoading _value, $Res Function(_$AccountLoading) _then)
      : super(_value, (v) => _then(v as _$AccountLoading));

  @override
  _$AccountLoading get _value => super._value as _$AccountLoading;
}

/// @nodoc

class _$AccountLoading implements AccountLoading {
  const _$AccountLoading();

  @override
  String toString() {
    return 'AccountState.accountLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return accountLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
  }) {
    return accountLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (accountLoading != null) {
      return accountLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return accountLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
  }) {
    return accountLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (accountLoading != null) {
      return accountLoading(this);
    }
    return orElse();
  }
}

abstract class AccountLoading implements AccountState {
  const factory AccountLoading() = _$AccountLoading;
}

/// @nodoc
abstract class _$$AccLoginLoadedCopyWith<$Res> {
  factory _$$AccLoginLoadedCopyWith(
          _$AccLoginLoaded value, $Res Function(_$AccLoginLoaded) then) =
      __$$AccLoginLoadedCopyWithImpl<$Res>;
  $Res call({LoginEntity loginEntity});
}

/// @nodoc
class __$$AccLoginLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$AccLoginLoadedCopyWith<$Res> {
  __$$AccLoginLoadedCopyWithImpl(
      _$AccLoginLoaded _value, $Res Function(_$AccLoginLoaded) _then)
      : super(_value, (v) => _then(v as _$AccLoginLoaded));

  @override
  _$AccLoginLoaded get _value => super._value as _$AccLoginLoaded;

  @override
  $Res call({
    Object? loginEntity = freezed,
  }) {
    return _then(_$AccLoginLoaded(
      loginEntity == freezed
          ? _value.loginEntity
          : loginEntity // ignore: cast_nullable_to_non_nullable
              as LoginEntity,
    ));
  }
}

/// @nodoc

class _$AccLoginLoaded implements AccLoginLoaded {
  const _$AccLoginLoaded(this.loginEntity);

  @override
  final LoginEntity loginEntity;

  @override
  String toString() {
    return 'AccountState.loginLoaded(loginEntity: $loginEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccLoginLoaded &&
            const DeepCollectionEquality()
                .equals(other.loginEntity, loginEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loginEntity));

  @JsonKey(ignore: true)
  @override
  _$$AccLoginLoadedCopyWith<_$AccLoginLoaded> get copyWith =>
      __$$AccLoginLoadedCopyWithImpl<_$AccLoginLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return loginLoaded(loginEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
  }) {
    return loginLoaded?.call(loginEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (loginLoaded != null) {
      return loginLoaded(loginEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return loginLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
  }) {
    return loginLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (loginLoaded != null) {
      return loginLoaded(this);
    }
    return orElse();
  }
}

abstract class AccLoginLoaded implements AccountState {
  const factory AccLoginLoaded(final LoginEntity loginEntity) =
      _$AccLoginLoaded;

  LoginEntity get loginEntity => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AccLoginLoadedCopyWith<_$AccLoginLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccRegisterLoadedCopyWith<$Res> {
  factory _$$AccRegisterLoadedCopyWith(
          _$AccRegisterLoaded value, $Res Function(_$AccRegisterLoaded) then) =
      __$$AccRegisterLoadedCopyWithImpl<$Res>;
  $Res call({RegisterEntity registerEntity});
}

/// @nodoc
class __$$AccRegisterLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$AccRegisterLoadedCopyWith<$Res> {
  __$$AccRegisterLoadedCopyWithImpl(
      _$AccRegisterLoaded _value, $Res Function(_$AccRegisterLoaded) _then)
      : super(_value, (v) => _then(v as _$AccRegisterLoaded));

  @override
  _$AccRegisterLoaded get _value => super._value as _$AccRegisterLoaded;

  @override
  $Res call({
    Object? registerEntity = freezed,
  }) {
    return _then(_$AccRegisterLoaded(
      registerEntity == freezed
          ? _value.registerEntity
          : registerEntity // ignore: cast_nullable_to_non_nullable
              as RegisterEntity,
    ));
  }
}

/// @nodoc

class _$AccRegisterLoaded implements AccRegisterLoaded {
  const _$AccRegisterLoaded(this.registerEntity);

  @override
  final RegisterEntity registerEntity;

  @override
  String toString() {
    return 'AccountState.registerLoaded(registerEntity: $registerEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccRegisterLoaded &&
            const DeepCollectionEquality()
                .equals(other.registerEntity, registerEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(registerEntity));

  @JsonKey(ignore: true)
  @override
  _$$AccRegisterLoadedCopyWith<_$AccRegisterLoaded> get copyWith =>
      __$$AccRegisterLoadedCopyWithImpl<_$AccRegisterLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return registerLoaded(registerEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
  }) {
    return registerLoaded?.call(registerEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(registerEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return registerLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
  }) {
    return registerLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(this);
    }
    return orElse();
  }
}

abstract class AccRegisterLoaded implements AccountState {
  const factory AccRegisterLoaded(final RegisterEntity registerEntity) =
      _$AccRegisterLoaded;

  RegisterEntity get registerEntity => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AccRegisterLoadedCopyWith<_$AccRegisterLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountErrorCopyWith<$Res> {
  factory _$$AccountErrorCopyWith(
          _$AccountError value, $Res Function(_$AccountError) then) =
      __$$AccountErrorCopyWithImpl<$Res>;
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$AccountErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$AccountErrorCopyWith<$Res> {
  __$$AccountErrorCopyWithImpl(
      _$AccountError _value, $Res Function(_$AccountError) _then)
      : super(_value, (v) => _then(v as _$AccountError));

  @override
  _$AccountError get _value => super._value as _$AccountError;

  @override
  $Res call({
    Object? error = freezed,
    Object? callback = freezed,
  }) {
    return _then(_$AccountError(
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

class _$AccountError implements AccountError {
  const _$AccountError(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'AccountState.accountError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), callback);

  @JsonKey(ignore: true)
  @override
  _$$AccountErrorCopyWith<_$AccountError> get copyWith =>
      __$$AccountErrorCopyWithImpl<_$AccountError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return accountError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
  }) {
    return accountError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (accountError != null) {
      return accountError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return accountError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
  }) {
    return accountError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (accountError != null) {
      return accountError(this);
    }
    return orElse();
  }
}

abstract class AccountError implements AccountState {
  const factory AccountError(
      final AppErrors error, final VoidCallback callback) = _$AccountError;

  AppErrors get error => throw _privateConstructorUsedError;
  VoidCallback get callback => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AccountErrorCopyWith<_$AccountError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessLogoutStateCopyWith<$Res> {
  factory _$$SuccessLogoutStateCopyWith(_$SuccessLogoutState value,
          $Res Function(_$SuccessLogoutState) then) =
      __$$SuccessLogoutStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessLogoutStateCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$SuccessLogoutStateCopyWith<$Res> {
  __$$SuccessLogoutStateCopyWithImpl(
      _$SuccessLogoutState _value, $Res Function(_$SuccessLogoutState) _then)
      : super(_value, (v) => _then(v as _$SuccessLogoutState));

  @override
  _$SuccessLogoutState get _value => super._value as _$SuccessLogoutState;
}

/// @nodoc

class _$SuccessLogoutState implements SuccessLogoutState {
  const _$SuccessLogoutState();

  @override
  String toString() {
    return 'AccountState.successLogout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessLogoutState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return successLogout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
  }) {
    return successLogout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (successLogout != null) {
      return successLogout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return successLogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
  }) {
    return successLogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (successLogout != null) {
      return successLogout(this);
    }
    return orElse();
  }
}

abstract class SuccessLogoutState implements AccountState {
  const factory SuccessLogoutState() = _$SuccessLogoutState;
}
