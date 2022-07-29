import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:starter_application/core/navigation/navigation_service.dart';
import 'package:starter_application/di/service_locator.dart';
import 'package:starter_application/features/account/presentation/screen/login_screen.dart';
import 'package:starter_application/features/account/presentation/screen/register_screen.dart';
import 'package:starter_application/features/home/presentation/screen/app_main_screen/app_main_screen.dart';

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
