// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i16;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

import '../core/navigation/navigation_service.dart' as _i19;
import '../core/navigation/route_generator.dart' as _i18;
import '../core/net/http_client.dart' as _i3;
import '../features/account/data/datasources/account_remote.dart' as _i5;
import '../features/account/data/datasources/iaccount_remote.dart' as _i4;
import '../features/account/data/repository/account_repository.dart' as _i7;
import '../features/account/domain/repository/iaccount_repository.dart' as _i6;
import '../features/account/domain/usecase/login_usecase.dart' as _i17;
import '../features/account/domain/usecase/register_usecase.dart' as _i20;
import '../features/camera/data/datasource/icamera_remote.dart' as _i8;
import '../features/camera/domain/repository/icamera_repository.dart' as _i9;
import '../features/home/data/datasource/home_remote.dart' as _i11;
import '../features/home/data/datasource/ihome_remote.dart' as _i10;
import '../features/home/data/repository/home_repository.dart' as _i13;
import '../features/home/domain/repository/ihome_repository.dart' as _i12;
import '../features/home/domain/usecase/get_people_usecase.dart' as _i26;
import '../features/home/domain/usecase/test_failure_usecase.dart' as _i22;
import '../features/home/domain/usecase/test_success_usecase.dart' as _i23;
import '../features/home/domain/usecase/test_validator_usecase.dart' as _i24;
import '../features/upload/data/datasource/iupload_remote.dart' as _i14;
import '../features/upload/domain/repository/iupload_repository.dart' as _i15;
import '../features/upload/domain/usecase/upload_file_usecase.dart' as _i25;
import 'modules/logger_module.dart' as _i27;
import 'modules/shared_preferences_module.dart'
    as _i28; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i8.ICameraRemoteSource>(_i8.CameraRemoteSource());
  gh.singleton<_i9.ICameraRepository>(
      _i9.CameraRepository(get<_i8.ICameraRemoteSource>()));
  gh.factory<_i10.IHomeRemoteSource>(() => _i11.HomeRemoteSource());
  gh.factory<_i12.IHomeRepository>(
      () => _i13.HomeRepository(get<_i10.IHomeRemoteSource>()));
  gh.singleton<_i14.IUploadRemoteSource>(_i14.UploadRemoteSource());
  gh.singleton<_i15.IUploadRepository>(
      _i15.UploadRepository(get<_i14.IUploadRemoteSource>()));
  gh.lazySingleton<_i16.Logger>(() => facebookLoginModule.facebookLogin);
  gh.factory<_i17.LoginUseCase>(
      () => _i17.LoginUseCase(get<_i6.IAccountRepository>()));
  gh.lazySingleton<_i18.NavigationRoute>(() => _i18.NavigationRoute());
  gh.lazySingleton<_i19.NavigationService>(() => _i19.NavigationService());
  gh.factory<_i20.RegisterUseCase>(
      () => _i20.RegisterUseCase(get<_i6.IAccountRepository>()));
  await gh.factoryAsync<_i21.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true);
  gh.factory<_i22.TestFailureUseCase>(
      () => _i22.TestFailureUseCase(get<_i12.IHomeRepository>()));
  gh.factory<_i23.TestSuccessUseCase>(
      () => _i23.TestSuccessUseCase(get<_i12.IHomeRepository>()));
  gh.factory<_i24.TestValidatorUseCase>(
      () => _i24.TestValidatorUseCase(get<_i12.IHomeRepository>()));
  gh.singleton<_i25.UploadFileUsecase>(
      _i25.UploadFileUsecase(get<_i15.IUploadRepository>()));
  gh.factory<_i26.GetPeopleUseCase>(
      () => _i26.GetPeopleUseCase(get<_i12.IHomeRepository>()));
  return get;
}

class _$FacebookLoginModule extends _i27.FacebookLoginModule {}

class _$SharedPreferencesModule extends _i28.SharedPreferencesModule {}
