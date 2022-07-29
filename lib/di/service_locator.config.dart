// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../core/navigation/navigation_service.dart' as _i17;
import '../core/navigation/route_generator.dart' as _i16;
import '../core/net/http_client.dart' as _i3;
import '../features/account/data/datasources/account_remote.dart' as _i5;
import '../features/account/data/datasources/iaccount_remote.dart' as _i4;
import '../features/account/data/repository/account_repository.dart' as _i7;
import '../features/account/domain/repository/iaccount_repository.dart' as _i6;
import '../features/account/domain/usecase/login_usecase.dart' as _i15;
import '../features/account/domain/usecase/register_usecase.dart' as _i18;
import '../features/home/data/datasource/home_remote.dart' as _i9;
import '../features/home/data/datasource/ihome_remote.dart' as _i8;
import '../features/home/data/repository/home_repository.dart' as _i11;
import '../features/home/domain/repository/ihome_repository.dart' as _i10;
import '../features/home/domain/usecase/get_people_usecase.dart' as _i24;
import '../features/home/domain/usecase/test_failure_usecase.dart' as _i20;
import '../features/home/domain/usecase/test_success_usecase.dart' as _i21;
import '../features/home/domain/usecase/test_validator_usecase.dart' as _i22;
import '../features/upload/data/datasource/iupload_remote.dart' as _i12;
import '../features/upload/domain/repository/iupload_repository.dart' as _i13;
import '../features/upload/domain/usecase/upload_file_usecase.dart' as _i23;
import 'modules/logger_module.dart' as _i25;
import 'modules/shared_preferences_module.dart'
    as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final facebookLoginModule = _$FacebookLoginModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.lazySingleton<_i3.HttpClient>(() => _i3.HttpClient());
  gh.factory<_i4.IAccountRemoteSource>(() => _i5.AccountRemoteSource());
  gh.factory<_i6.IAccountRepository>(
      () => _i7.AccountRepository(get<_i4.IAccountRemoteSource>()));
  gh.factory<_i8.IHomeRemoteSource>(() => _i9.HomeRemoteSource());
  gh.factory<_i10.IHomeRepository>(
      () => _i11.HomeRepository(get<_i8.IHomeRemoteSource>()));
  gh.singleton<_i12.IUploadRemoteSource>(_i12.UploadRemoteSource());
  gh.singleton<_i13.IUploadRepository>(
      _i13.UploadRepository(get<_i12.IUploadRemoteSource>()));
  gh.lazySingleton<_i14.Logger>(() => facebookLoginModule.facebookLogin);
  gh.factory<_i15.LoginUseCase>(
      () => _i15.LoginUseCase(get<_i6.IAccountRepository>()));
  gh.lazySingleton<_i16.NavigationRoute>(() => _i16.NavigationRoute());
  gh.lazySingleton<_i17.NavigationService>(() => _i17.NavigationService());
  gh.factory<_i18.RegisterUseCase>(
      () => _i18.RegisterUseCase(get<_i6.IAccountRepository>()));
  await gh.factoryAsync<_i19.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true);
  gh.factory<_i20.TestFailureUseCase>(
      () => _i20.TestFailureUseCase(get<_i10.IHomeRepository>()));
  gh.factory<_i21.TestSuccessUseCase>(
      () => _i21.TestSuccessUseCase(get<_i10.IHomeRepository>()));
  gh.factory<_i22.TestValidatorUseCase>(
      () => _i22.TestValidatorUseCase(get<_i10.IHomeRepository>()));
  gh.singleton<_i23.UploadFileUsecase>(
      _i23.UploadFileUsecase(get<_i13.IUploadRepository>()));
  gh.factory<_i24.GetPeopleUseCase>(
      () => _i24.GetPeopleUseCase(get<_i10.IHomeRepository>()));
  return get;
}

class _$FacebookLoginModule extends _i25.FacebookLoginModule {}

class _$SharedPreferencesModule extends _i26.SharedPreferencesModule {}
