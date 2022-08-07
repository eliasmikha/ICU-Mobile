import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:starter_application/core/navigation/navigation_service.dart';
import 'package:starter_application/di/service_locator.dart';
import 'package:starter_application/features/account/presentation/screen/confirm_account/confirm_account_screen.dart';
import 'package:starter_application/features/account/presentation/screen/login_screen.dart';
import 'package:starter_application/features/account/presentation/screen/register_screen.dart';
import 'package:starter_application/features/camera/presentation/screen/add_camera/add_camera_screen.dart';
import 'package:starter_application/features/camera/presentation/screen/camera_details/camera_details_screen.dart';
import 'package:starter_application/features/camera/presentation/screen/camera_list/camera_list_screen.dart';
import 'package:starter_application/features/home/presentation/screen/app_main_screen/app_main_screen.dart';
import 'package:starter_application/features/more/presentation/screen/notifications_list/notifications_list_screen.dart';
import 'package:starter_application/features/persons/presentation/screen/add_person/add_person_screen_content.dart';
import 'package:starter_application/features/persons/presentation/screen/person_details/person_details_screen_content.dart';

import '../../features/persons/presentation/screen/add_person/add_person_screen.dart';
import '../../features/persons/presentation/screen/person_details/person_details_screen.dart';
import '../constants/enums/route_type.dart';
import '../ui/screens/base_screen.dart';
import 'animations/animated_route.dart';
import 'animations/fade_route.dart';

@lazySingleton
class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case LoginScreen.routeName:
        return _getRoute<LoginScreenParam>(
            settings: settings,
            createScreen: (param) => LoginScreen(param: param));
      case RegisterScreen.routeName:
        return _getRoute<RegisterScreenParam>(
          settings: settings,
          createScreen: (param) => RegisterScreen(param: param),
          type: RouteType.ANIMATED,
        );
      case AppMainScreen.routeName:
        return _getRoute<AppMainScreenParam>(
          settings: settings,
          createScreen: (param) => AppMainScreen(param: param),
        );
      case ConfirmAccountScreen.routeName:
        return _getRoute<ConfirmAccountScreenParam>(
          settings: settings,
          createScreen: (param) => ConfirmAccountScreen(param: param),
        );
      case CameraListScreen.routeName:
        return _getRoute<CameraListScreenParam>(
          settings: settings,
          createScreen: (param) => CameraListScreen(param: param),
        );
      case AddCameraScreen.routeName:
        return _getRoute<AddCameraScreenParam>(
          settings: settings,
          createScreen: (param) => AddCameraScreen(param: param),
        );
      case CameraDetailsScreen.routeName:
        return _getRoute<CameraDetailsScreenParam>(
          settings: settings,
          createScreen: (param) => CameraDetailsScreen(param: param),
        );
      case NotificationsListScreen.routeName:
        return _getRoute<NotificationsListScreenParam>(
          settings: settings,
          createScreen: (param) => NotificationsListScreen(param: param),
        );
      case AddPersonScreen.routeName:
        return _getRoute<AddPersonScreenParam>(
          settings: settings,
          createScreen: (param) => AddPersonScreen(param: param),
        );
      case PersonDetailsScreen.routeName:
        return _getRoute<PersonDetailsScreenParam>(
          settings: settings,
          createScreen: (param) => PersonDetailsScreen(param: param),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  Route _getRoute<ParamType>({
    required RouteSettings settings,
    required BaseScreen createScreen(
      ParamType param,
    ),
    RouteType type = RouteType.FADE,
  }) {
    try {
      final args = settings.arguments;
      if (args != null && args is ParamType) {
        switch (type) {
          case RouteType.FADE:
            return FadeRoute(
              page: createScreen(
                args as ParamType,
              ),
              settings: settings,
            );
          case RouteType.ANIMATED:
            return AnimatedRoute(
              page: createScreen(
                args as ParamType,
              ),
              settings: settings,
            );
        }
      }
    } catch (e) {
      return _errorRoute();
    }

    return _errorRoute();
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(
                  getIt<NavigationService>().getNavigationKey.currentContext!)
              .scaffoldBackgroundColor,
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ROUTE ERROR CHECK THE ROUTE GENERATOR'),
          ),
        );
      },
    );
  }
}
