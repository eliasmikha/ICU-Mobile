import 'package:starter_application/core/constants/enums/app_options_enum.dart';
import 'package:starter_application/core/errors/error_global_handler/catcher_handler.dart';

part 'options_config.dart';

/// Changes here will reflect to application
/// Most common things we need to change will be handled here
/// Adding a new Option should goes in [options_config.dart] then reflecting it
/// into here
class AppOptions {
  static final _instance = AppOptions._fromMap(_appOptions);

  factory AppOptions() {
    return _instance;
  }

  AppOptions._({
    required this.orientation,
    required this.errorViewOption,
    required this.changeLangRestart,
    required this.enableDioPrinting,
    required this.enableErrorCatcher,
    required this.forceLocationPermission,
    required this.enableNotification,
  });

  /// Orientation option
  final OrientationOptions orientation;

  /// Error viewer view options
  final ErrorWidgetOptions errorViewOption;

  /// If app restart on change language or not
  final bool changeLangRestart;

  /// Enable dio printing for debugging purposes
  final bool enableDioPrinting;

  /// Enable [CatcherHandler] to handle any red screen with report
  final bool enableErrorCatcher;

  /// force the user to enable location permission
  final bool forceLocationPermission;

  /// Enable notification (firbaseMessaging, localNotification)
  final bool enableNotification;

  /// Reading options from [options_config]
  factory AppOptions._fromMap(Map<String, dynamic> json) => AppOptions._(
        orientation: json["orientation"] ?? OrientationOptions.BOTH,
        errorViewOption: json["error_view_option"] ?? ErrorWidgetOptions.IMAGE,
        changeLangRestart: json["change_lang_restart"] ?? false,
        enableDioPrinting: json["enable_dio_printing"] ?? true,
        enableErrorCatcher: json["enable_error_catcher"] ?? true,
        forceLocationPermission: json["force_location_permission"] ?? false,
        enableNotification: json["enable_notification"] ?? false,
      );
}
