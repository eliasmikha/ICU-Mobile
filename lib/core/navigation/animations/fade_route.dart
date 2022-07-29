import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({
    required this.page,
    required RouteSettings settings,
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          settings: settings,
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 300),
          reverseTransitionDuration:
              reverseTransitionDuration ?? const Duration(milliseconds: 300),
        );
}
