import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart' as ftoast;
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void show(
    String msg, {
    int duration = 2000,
    ftoast.Toast androidDuration = ftoast.Toast.LENGTH_LONG,
    double fontSize = 12,
    ftoast.ToastGravity gravity = ftoast.ToastGravity.BOTTOM,
    Color? backgroundColor,
    Color? textColor,
  }) {
    showToast(
      msg,
      toastLength: androidDuration,
      gravity: gravity,
      timeInSecForIosWeb: duration,
      fontSize: fontSize,
      bg: backgroundColor,
      textColor: textColor,
    );
  }

// static void cancelToast() {
// }
}

void showToast(
  String msg, {
  double? fontSize,
  ToastGravity? gravity,
  Color? bg,
  Color? textColor,
  ftoast.Toast? toastLength,
  int timeInSecForIosWeb = 1,
}) async {
  // Cancel prev toast
  await ftoast.Fluttertoast.cancel();

  // Show toast
  ftoast.Fluttertoast.showToast(
    msg: msg,
    fontSize: fontSize,
    gravity: gravity,
    backgroundColor: bg,
    textColor: textColor,
    timeInSecForIosWeb: timeInSecForIosWeb,
    toastLength: toastLength,
  );
}
