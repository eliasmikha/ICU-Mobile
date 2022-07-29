import 'package:starter_application/core/ui/snackbars/show_snackbar.dart';

import 'errv_snack_bar_options.dart';

void showErrorSnackBar({
  String? message,
  ErrVSnackBarOptions? errVSnackBarOptions,
}) {
  showSnackbar(
    message ?? "",
    isError: true,
    backgroundColor: errVSnackBarOptions?.backgroundColor,
  );
}
