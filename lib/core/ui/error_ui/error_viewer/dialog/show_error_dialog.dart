import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:starter_application/core/ui/dialogs/custom_dialogs.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/dialog/errv_dialog_options.dart';
import 'package:starter_application/generated/l10n.dart';

void showCustomErrorDialog({
  required BuildContext context,
  String? message,
  VoidCallback? callback,
  required ErrVDialogOptions errVDialogOptions,
}) {
  if (Platform.isIOS ||
      errVDialogOptions.errVDialogType == ErrVDialogType.message) {
    showCustomMessageDialog(
      context: context,
      content: message ?? "",
      title: errVDialogOptions.title ?? S.current.oopsErrorMessage,
      onButtonPressed: errVDialogOptions.confirmOptions?.onBtnPressed ??
          (a) {
            Navigator.pop(context);
            if (callback != null) callback();
          },
      buttonText:
          errVDialogOptions.confirmOptions?.buttonText ?? S.current.retry,
    );
  }
  if (Platform.isAndroid) {
    showCustomConfirmCancelDialog(
      mainContext: context,
      content: message ?? "",
      title: errVDialogOptions.title ?? S.current.oopsErrorMessage,
      onConfirm: errVDialogOptions.confirmOptions?.onBtnPressed ??
          (dContext) {
            Navigator.pop(dContext);
            if (callback != null) callback();
          },
      // onCancel: (dContext) async => await SystemNavigator.pop(),
      onCancel: errVDialogOptions.cancelOptions?.onBtnPressed ??
          (dContext) async => Navigator.pop(dContext),
      confirmText:
          errVDialogOptions.confirmOptions?.buttonText ?? S.current.retry,
      cancelText:
          errVDialogOptions.cancelOptions?.buttonText ?? S.current.cancel,
      isDismissible: false,
    );
  }
}
