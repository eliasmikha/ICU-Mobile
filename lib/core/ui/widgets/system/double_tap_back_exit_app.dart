import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_application/generated/l10n.dart';

import '../../show_toast.dart';

class DoubleTapBackExitApp extends StatefulWidget {
  const DoubleTapBackExitApp({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 2500),
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  _DoubleTapBackExitAppState createState() => _DoubleTapBackExitAppState();
}

class _DoubleTapBackExitAppState extends State<DoubleTapBackExitApp> {
  DateTime _lastTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _isExit(context),
      child: widget.child,
    );
  }

  Future<bool> _isExit(BuildContext context) async {
    if (DateTime.now().difference(_lastTime) > widget.duration) {
      _lastTime = DateTime.now();
      CustomToast.show(S.current.pressTwiceToExit);
      return Future.value(false);
    }
    // Toast.cancelToast();
    await SystemNavigator.pop();
    return Future.value(true);
  }
}
