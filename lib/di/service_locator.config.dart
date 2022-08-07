// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i25;
import 'package:shared_preferences/shared_preferences.dart' as _i30;

import '../core/navigation/navigation_service.dart' as _i28;
import '../core/navigation/route_generator.dart' as _i27;
import '../core/net/http_client.dart' as _i3;
import '../features/account/data/datasources/account_remote.dart' as _i5;
import '../features/account/data/datasources/iaccount_remote.dart' as _i4;
import '../features/account/data/repository/account_repository.dart' as _i7;
import '../features/account/domain/repository/iaccount_repository.dart' as _i6;
import '../features/account/domain/usecase/login_usecase.dart' as _i26;
import '../features/account/domain/usecase/register_usecase.dart' as _i29;
import '../features/branch/data/datasource/ibranch_remote.dart' as _i8;
import '../features/branch/domain/repository/ibranch_repository.dart' as _i9;
import '../features/branch/domain/usecase/get_branches_list_usecase.dart'
    as _i34;
import '../features/camera/data/datasource/icamera_remote.dart' as _i10;
import '../features/camera/domain/repository/icamera_repository.dart' as _i11;
import '../features/camera/domain/usecase/get_all_cameras_usecase.dart' as _i33;
import '../features/department/data/datasource/idepartment_remote.dart' as _i12;
import '../features/department/domain/repository/idepartment_repository.dart'
    as _i13;
import '../features/home/data/datasource/ihome_remote.dart' as _i14;
import '../features/home/data/repository/home_repository.dart' as _i16;
import '../features/home/domain/repository/ihome_repository.dart' as _i15;
import '../features/more/data/datasource/imore_remote.dart' as _i17;
import '../features/more/domain/repository/imore_repository.dart' as _i18;
import '../features/persons/data/datasource/ipersons_remote.dart' as _i19;
import '../features/persons/domain/repository/ipersons_repository.dart' as _i20;
import '../features/persons/domain/usecase/add_person_usecase.dart' as _i32;
import '../features/persons/domain/usecase/get_persons_list_usecase.dart'
    as _i35;
import '../features/room/data/datasource/iroom_remote.dart' as _i21;
import '../features/room/domain/repository/iroom_repository.dart' as _i22;
import '../features/upload/data/datasource/iupload_remote.dart' as _i23;
import '../features/upload/domain/repository/iupload_repository.dart' as _i24;
import '../features/upload/domain/usecase/upload_file_usecase.dart' as _i31;
import 'modules/logger_module.dart' as _i36;
import 'modules/shared_preferences_module.dart'
    as _i37; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i8.IBranchRemoteSource>(_i8.BranchRemoteSource());
  gh.singleton<_i9.IBranchRepository>(
      _i9.BranchRepository(get<_i8.IBranchRemoteSource>()));
  gh.singleton<_i10.ICameraRemoteSource>(_i10.CameraRemoteSource());
  gh.singleton<_i11.ICameraRepository>(
      _i11.CameraRepository(get<_i10.ICameraRemoteSource>()));
  gh.singleton<_i12.IDepartmentRemoteSource>(_i12.DepartmentRemoteSource());
  gh.singleton<_i13.IDepartmentRepository>(
      _i13.DepartmentRepository(get<_i12.IDepartmentRemoteSource>()));
  gh.factory<_i14.IHomeRemoteSource>(() => _i14.HomeRemoteSource());
  gh.factory<_i15.IHomeRepository>(
      () => _i16.HomeRepository(get<_i14.IHomeRemoteSource>()));
  gh.singleton<_i17.IMoreRemoteSource>(_i17.MoreRemoteSource());
  gh.singleton<_i18.IMoreRepository>(
      _i18.MoreRepository(get<_i17.IMoreRemoteSource>()));
  gh.singleton<_i19.IPersonsRemoteSource>(_i19.PersonsRemoteSource());
  gh.singleton<_i20.IPersonsRepository>(
      _i20.PersonsRepository(get<_i19.IPersonsRemoteSource>()));
  gh.singleton<_i21.IRoomRemoteSource>(_i21.RoomRemoteSource());
  gh.singleton<_i22.IRoomRepository>(
      _i22.RoomRepository(get<_i21.IRoomRemoteSource>()));
  gh.singleton<_i23.IUploadRemoteSource>(_i23.UploadRemoteSource());
  gh.singleton<_i24.IUploadRepository>(
      _i24.UploadRepository(get<_i23.IUploadRemoteSource>()));
  gh.lazySingleton<_i25.Logger>(() => facebookLoginModule.facebookLogin);
  gh.factory<_i26.LoginUseCase>(
      () => _i26.LoginUseCase(get<_i6.IAccountRepository>()));
  gh.lazySingleton<_i27.NavigationRoute>(() => _i27.NavigationRoute());
  gh.lazySingleton<_i28.NavigationService>(() => _i28.NavigationService());
  gh.factory<_i29.RegisterUseCase>(
      () => _i29.RegisterUseCase(get<_i6.IAccountRepository>()));
  await gh.factoryAsync<_i30.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true);
  gh.singleton<_i31.UploadFileUsecase>(
      _i31.UploadFileUsecase(get<_i24.IUploadRepository>()));
  gh.singleton<_i32.AddPersonUsecase>(
      _i32.AddPersonUsecase(get<_i20.IPersonsRepository>()));
  gh.singleton<_i33.GetAllCamerasUsecase>(
      _i33.GetAllCamerasUsecase(get<_i11.ICameraRepository>()));
  gh.singleton<_i34.GetBranchesListUsecase>(
      _i34.GetBranchesListUsecase(get<_i9.IBranchRepository>()));
  gh.singleton<_i35.GetPersonsListUsecase>(
      _i35.GetPersonsListUsecase(get<_i20.IPersonsRepository>()));
  return get;
}

class _$FacebookLoginModule extends _i36.FacebookLoginModule {}

class _$SharedPreferencesModule extends _i37.SharedPreferencesModule {}
