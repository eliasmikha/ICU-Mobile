import 'package:starter_application/core/common/utils/utils.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'dialog/show_dialog_based_error_type.dart';
import 'dialog/show_error_dialog.dart';
import 'dialog/errv_dialog_options.dart';
import 'errv_options.dart';
import 'snack_bar/errv_snack_bar_options.dart';
import 'toast/errv_toast_options.dart';
import 'package:flutter/cupertino.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'snack_bar/show_error_snackbar.dart';
import 'snack_bar/show_snackbar_based_error_type.dart';
import 'toast/show_error_toast.dart';
import 'toast/show_toast_based_error_type.dart';

class ErrorViewer {
  static showError({
    required BuildContext context,
    required AppErrors error,
    required VoidCallback callback,
    ErrorViewerOptions errorViewerOptions = const ErrVToastOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showSnakBarBasedErrorType(
        context,
        error,
        callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showToastBasedErrorType(
        context,
        error,
        callback,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showDialogBasedErrorType(
        context,
        error,
        callback,
        errVDialogOptions: errorViewerOptions,
      );
    }
  }

  static void showCancelError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.cancelErrorMessage,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.cancelErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.cancelErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showAccountNotVerifiedError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.accountNotVerifiedErrorMessage,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.accountNotVerifiedErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.accountNotVerifiedErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showInternalServerError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.internalServerErrorMessage,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.internalServerErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.internalServerErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showFormatError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.generalErrorMessage,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.generalErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.generalErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showConnectionError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.connectionErrorMessage,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.connectionErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.connectionErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showCustomError(
    BuildContext context,
    String message, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: message,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: message,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: message,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showUnexpectedError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.generalErrorMessage,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.generalErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.generalErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showUnauthorizedError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.unauthorized,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.unauthorized,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.unauthorized,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }

    Utils.logout();
  }

  static void showBadRequestError(
    BuildContext context,
    String? message, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: message ?? S.current.badRequest,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: message ?? S.current.badRequest,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: message ?? S.current.badRequest,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showForbiddenError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.forbidden,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.forbidden,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.forbidden,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }

    Utils.logout();
  }

  static void showNotFoundError(
    BuildContext context, {
    @required url,
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.notFound(url),
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.notFound(url),
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.notFound(url),
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showConflictError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.conflictError,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.conflictError,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.conflictError,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showTimeoutError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.connectionTimeOut,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.connectionTimeOut,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.connectionTimeOut,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showUnknownError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: S.current.unknownError,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: S.current.unknownError,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: S.current.unknownError,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showSocketError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions ||
        errorViewerOptions is ErrVToastOptions ||
        errorViewerOptions is ErrVDialogOptions) {
      ErrVDialogOptions? errVDialogOptions = null;

      if (errorViewerOptions is ErrVDialogOptions) {
        errVDialogOptions = errorViewerOptions;
      }

      showCustomErrorDialog(
        context: context,
        message: S.current.connectionErrorMessage,
        callback: callback,
        errVDialogOptions: errVDialogOptions ?? const ErrVDialogOptions(),
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }
}
