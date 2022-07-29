import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;
import 'package:starter_application/core/ui/show_toast.dart';

import 'errv_toast_options.dart';

void showErrorToast({
  String? message,
  required ErrVToastOptions errVToastOptions,
}) {
  CustomToast.show(
    message ?? "",
    androidDuration: toast.Toast.LENGTH_LONG,
    gravity: errVToastOptions.toastGravity ?? toast.ToastGravity.BOTTOM,
    backgroundColor: errVToastOptions.backGroundColor ?? Colors.black,
    textColor: errVToastOptions.textColor ?? Colors.white,
  );
}
