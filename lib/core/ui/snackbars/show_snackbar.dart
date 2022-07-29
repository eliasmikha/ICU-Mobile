import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../../di/service_locator.dart';
import '../../navigation/navigation_service.dart';

Flushbar? _flushbar;

Future<void> showSnackbar(
  String message, {
  bool isError = false,
  Color? backgroundColor,
}) async {
  final ctx = getIt<NavigationService>().appContext;
  if (ctx == null) return;
  if (_flushbar != null &&
      (_flushbar!.isShowing() || _flushbar!.isAppearing()) &&
      _flushbar!.message?.toLowerCase() == message.toLowerCase()) return;

  if (_flushbar != null && _flushbar!.isDismissible) _flushbar!.dismiss();
  _flushbar = Flushbar(
    message: message,
    backgroundColor: backgroundColor ??
        (isError ? Colors.red : Theme.of(ctx).colorScheme.primary),
    titleColor: Colors.white,
    duration: const Duration(milliseconds: 3000),
  );
  await _flushbar!.show(ctx);
}
