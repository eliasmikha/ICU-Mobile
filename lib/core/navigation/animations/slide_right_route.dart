import 'package:flutter/material.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({
    required this.page,
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
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 300),
          reverseTransitionDuration:
              reverseTransitionDuration ?? const Duration(milliseconds: 300),
        );
}
