import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/firebase/firebase_messaging.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:starter_application/core/ui/widgets/restart_widget.dart';
import 'package:starter_application/features/account/presentation/state_m/cubit/account_cubit.dart';
import 'package:starter_application/features/home/presentation/screen/app_main_screen/app_main_screen_content.dart';
import 'package:starter_application/features/home/presentation/screen/home_screen/home_screen.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/app_main_screen_notifier.dart';

class AppMainScreenParam {}

class AppMainScreen extends BaseScreen<AppMainScreenParam> {
  static const String routeName = "/AppMainScreenScreen";

  const AppMainScreen({
    Key? key,
    required AppMainScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  late final AppMainScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = AppMainScreenNotifier(widget.param);
    if (AppConfig().appOptions.enableNotification &&
        FireBaseMessagingWrapper.notificationLock.isLocked)
      FireBaseMessagingWrapper.notificationLock.release();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppMainScreenNotifier>.value(
      value: sn,
      child: const AppMAinScreenContent(),
      builder: (context, child) {
        // listen to isLoading state.
        context.select<AppMainScreenNotifier, bool>((p) => p.isLoading);

        return ModalProgressHUD(
          inAsyncCall: sn.isLoading,
          child: BlocListener<AccountCubit, AccountState>(
            bloc: sn.logoutCubit,
            listener: (context, state) {
              state.maybeWhen(
                accountLoading: () => sn.isLoading = true,
                accountError: (error, callback) {
                  sn.isLoading = false;
                  ErrorViewer.showError(
                      context: context, error: error, callback: callback);
                },
                successLogout: () {
                  sn.isLoading = false;
                  RestartWidget.restartApp(context);
                },
                orElse: () {},
              );
            },
            child: child,
          ),
        );
      },
    );
  }
}
