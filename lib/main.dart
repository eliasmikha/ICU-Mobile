import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/constants/enums/app_options_enum.dart';
import 'package:starter_application/core/navigation/navigation_service.dart';
import 'package:starter_application/core/ui/error_ui/errors_screens/build_error_screen.dart';
import 'package:starter_application/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'core/common/app_config.dart';
import 'core/errors/error_global_handler/catcher_handler.dart';
import 'core/errors/error_global_handler/email_manual_handler.dart';
import 'core/errors/error_global_handler/report.dart';
import 'core/firebase/firebase_messaging.dart';
import 'core/localization/localization_provider.dart';
import 'core/net/http_overrides.dart';
import 'generated/l10n.dart';

void main() async {
  await _initAppConfigs();

  runApp(const App());
}

_initAppConfigs() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setSystemUIChangeCallback(
    (systemOverlaysAreVisible) async {
      if (!systemOverlaysAreVisible)
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    },
  );

  KeyboardVisibilityController().onChange.listen(
    (visible) {
      if (!visible)
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    },
  );

  /// Injectable initialization
  await configureInjection();

  /// Init Language.
  await LocalizationProvider().fetchLocale();

  /// Init app config
  AppConfig().initApp();

  /// Init rotation of app (Should be called after [AppConfig.initApp()])
  await _initAppRotation();

  /// Init error catcher to catch any red screen error and add ability to send
  /// a report to developer e-mail
  _initErrorCatcher();

  /// In case of network handshake error
  HttpOverrides.global = new BadCertHttpOverrides();

  if (AppConfig().appOptions.enableNotification) {
    await FireBaseMessagingWrapper.notificationLock.acquire();

    /// Init firebase
    await Firebase.initializeApp();

    /// Init firebase messaging
    await FireBaseMessagingWrapper().init(onRefreshToken: () async {});

    if (!await LocalStorage.hasToken)
      await FireBaseMessagingWrapper().deleteFirebaseToken();
  }
}

Future<void> _initAppRotation() async {
  final appOption = AppConfig().appOptions;

  switch (appOption.orientation) {
    case OrientationOptions.PORTRAIT:
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );
      break;
    case OrientationOptions.LANDSCAPE:
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      );
      break;
    case OrientationOptions.BOTH:
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      );
      break;
  }
}

void _initErrorCatcher() {
  final appOption = AppConfig().appOptions;
  if (appOption.enableErrorCatcher) {
    /// Initialize the error screen with our custom error catcher
    ErrorWidget.builder = (flutterErrorDetails) {
      final _catcherHandler = CatcherHandler();

      /// We must init the catcher handler parameters
      _catcherHandler.init();

      final context = getIt<NavigationService>().appContext;

      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(140)),
          child: Center(
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildErrorScreen(
                    disableRetryButton: true,
                    title: S.of(context!).errorOccurred,
                    content: S.current.reportError,
                    imageUrl: AppConstants.ERROR_UNKNOWING,
                    callback: null,
                    context: context,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      S.current.send,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Report? report = _catcherHandler.createReport(
                          flutterErrorDetails.exception,
                          flutterErrorDetails.stack,
                          errorDetails: flutterErrorDetails);
                      if (report != null) {
                        EmailManualHandler(
                          ["issa.asous.1999@gmail.com"],
                          emailHeader: 'StarterApp',
                          emailTitle:
                              'Error report ${DateFormat("").format(DateTime.now())}',
                        ).handle(report);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    };
  }
}
