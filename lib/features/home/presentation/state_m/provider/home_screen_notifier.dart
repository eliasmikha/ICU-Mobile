import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_application/core/common/costum_modules/screen_notifier.dart';
import 'package:starter_application/core/common/extensions/extensions.dart';
import 'package:starter_application/core/common/utils/utils.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/models/empty_response.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/ui/dialogs/language_dialog.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';
import 'package:starter_application/core/ui/show_toast.dart';
import 'package:starter_application/features/home/presentation/screen/people_screen.dart';
import 'package:starter_application/features/home/presentation/state_m/cubit/home_cubit.dart';
import 'package:starter_application/features/home/presentation/state_m/provider/app_main_screen_notifier.dart';
import 'package:starter_application/generated/l10n.dart';

import '../../screen/map_screen.dart';

class HomeScreenNotifier extends ScreenNotifier {
  /// Fields

  final HomeCubit homeCubit = HomeCubit();

  bool _isLoading = false;

  /// Methods

  void homeLoadingStateListener() {
    _isLoading = true;
    notifyListeners();
  }

  void homeLoadedStateListener(EmptyResponse s) {
    "Response Succeeded".logI;
    _isLoading = false;
    CustomToast.show(s.message);
    notifyListeners();
  }

  void homeErrorStateListener(
    BuildContext context,
    AppErrors error,
    VoidCallback callback,
  ) {
    "Response Failed".logI;
    _isLoading = false;

    ErrorViewer.showError(
        context: context,
        error: error,
        callback: callback,
        errorViewerOptions: const ErrVSnackBarOptions());

    notifyListeners();
  }

  void onLogoutTap(BuildContext context) {
    context.read<AppMainScreenNotifier>().logout();
  }

  void onGetPeopleTap(BuildContext context) {
    Nav.to(PeopleScreen.routeName, arguments: PeopleScreenParam());
  }

  void onMapTap() {
    Nav.to(
      MapScreen.routeName,
      arguments: MapScreenParam(),
    );
  }

  void onTestValidatorRequestTap() {
    homeCubit.testValidator();
  }

  void onTestFailurRequestTap() {
    homeCubit.testFailure();
  }

  void onTestSuccessRequestTap() {
    homeCubit.testSuccess();
  }

  void onJustLogTap() {
    "Error message".logE;
    "Debug message".logD;
    "Info message".logI;
    "Warning message".logW;
    CustomToast.show("Look at console");
  }

  void onChangeLanguageDialogTap(BuildContext context) {
    showLanguageDialog(
      context: context,
    );
  }

  void onThemeSwitcherTap(BuildContext context) {
    Utils.changeTheme(context);
  }

  String getHomeScreenTitle(BuildContext context) {
    return S.current.homePage;
  }

  IconData getThemeIcon(BuildContext context) {
    return (Theme.of(context).brightness) == Brightness.light
        ? Icons.nightlight_round_outlined
        : Icons.wb_sunny_outlined;
  }

  @override
  void closeNotifier() {
    homeCubit.close();
    this.dispose();
  }

  /// Getters and Setters

  get isLoading => this._isLoading;
}
