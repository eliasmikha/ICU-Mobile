import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:package_info/package_info.dart';
import 'package:starter_application/core/common/app_options/app_options.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/constants/enums/system_type.dart';
import 'package:starter_application/core/localization/flutter_localization.dart';
import 'package:starter_application/core/navigation/navigation_service.dart';
import 'package:starter_application/core/theme/themes_data.dart';
import 'package:starter_application/di/service_locator.dart';
import 'package:platform_device_id/platform_device_id.dart';


/// This class it contain multiple core functions
/// for get device info
/// for get and set language
/// for current app theme
/// for options in application
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  final String apiKey = "";
  SystemType? _os;
  String? _currentVersion;
  String? _buildNumber;
  String? _appName;
  String? _appVersion;
  ThemeMode _themeMode = ThemeMode.light;
  AppOptions _appOptions = AppOptions();

  BuildContext? get appContext => getIt<NavigationService>().appContext;

  Locale get appLanguage => LocalizationProvider().appLocal;

  SystemType? get os => _os;

  String? get currentVersion => _currentVersion;

  String? get buildNumber => _buildNumber;

  String? get appVersion => _appVersion;

  String? get appName => _appName;

  AppOptions get appOptions => _appOptions;

  ThemeData get themeData => _themeMode == ThemeMode.light
      ? ThemesData.lightTheme
      : ThemesData.darkTheme;

  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode v) {
    _themeMode = v;
  }

  String? deviceId;

  Future<String?> _getDeviceId() async {
    return await PlatformDeviceId.getDeviceId;
  }

  initApp() async {
    /// get OS
    if (Platform.isIOS) {
      _os = SystemType.IOS;
    }
    if (Platform.isAndroid) {
      _os = SystemType.Android;
    }

    /// get version
    final packageInfo = await PackageInfo.fromPlatform();
    _currentVersion = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    _appName = packageInfo.appName;

    /// Get Initital Theme Mode
    _themeMode = LocalStorage.getThemeMode;

    deviceId = await _getDeviceId();
  }

  static Size screenUtilDesignSize() {
    if (Device.get().isTablet) return const Size(1536, 2048);

    if (Device.get().isPhone) return const Size(1080, 1920);

    return const Size(1080, 1920);
  }
}
