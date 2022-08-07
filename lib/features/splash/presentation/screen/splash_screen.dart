import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/features/account/presentation/screen/login_screen.dart';

import '../../../../core/common/app_config.dart';
import '../../../../core/ui/error_ui/error_viewer/dialog/errv_dialog_options.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/screen/app_main_screen/app_main_screen.dart';
import '../../domain/entity/splash_entity.dart';
import '../cubit/splash_cubit.dart';
import 'splash_screen_content.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashCubit = SplashCubit();
  bool canGo = false;

  @override
  void initState() {
    super.initState();
    splashCubit.getSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202648),
      body: BlocListener<SplashCubit, SplashState>(
        bloc: splashCubit,
        listener: (context, state) {
          state.map(
            initial: (e) {},
            loading: (e) {},
            loaded: (s) => _splashScreenLoaded(context, s),
            error: (e) => _handleSplashError(context, e),
          );
        },
        child: SplashScreenContent(
          onAnimationFinished: () {
            if (canGo)
              outFromSplash();
            else
              canGo = true;
          },
        ),
      ),
    );
  }

  void _handleSplashError(BuildContext context, ErrorState errorState) {
    ErrorViewer.showError(
      context: context,
      error: errorState.error,
      callback: errorState.callback,
      errorViewerOptions: ErrVDialogOptions(
        isDismissible: false,
        cancelOptions: ErrVButtonOptions(
          buttonText: S.current.closeApp,
          onBtnPressed: (context) {
            SystemNavigator.pop();
          },
        ),
      ),
    );
  }

  void _splashScreenLoaded(
      BuildContext context, LoadedState loadedState) async {
    if (canGo) {
      outFromSplash();
    } else {
      canGo = true;
    }
  }

  void _getDataFromSplash(SplashEntity splashEntity) {
    // context.read<BranchesScreenNotifier>().serviceBranches =
    //     splashEntity.homeInitEntity.serviceBranches;
    // context.read<BranchesScreenNotifier>().showRoomBranches =
    //     splashEntity.homeInitEntity.showRoomBranches;
    // context.read<BranchesScreenNotifier>().contactNumber =
    //     splashEntity.homeInitEntity.contact;
    // context.read<HomeScreenNotifier>().offers =
    //     splashEntity.homeInitEntity.offers;
    // context.read<HomeScreenNotifier>().newCars =
    //     splashEntity.homeInitEntity.models;
    // splashEntity.homeInitEntity.cars;
    // context.read<SessionData>().profileEntity = splashEntity.profile;
    // context.read<SessionData>().homeInitEntity = splashEntity.homeInitEntity;
  }

  void outFromSplash() async {
    handleNavigation();
  }

  void handleNavigation() async {
    if (LocalStorage.hasToken)
      Nav.off(
        AppMainScreen.routeName,
        arguments: AppMainScreenParam(),
      );
    else
      Nav.off(
        LoginScreen.routeName,
        arguments: LoginScreenParam(),
      );
  }

  @override
  void dispose() {
    splashCubit.close();
    super.dispose();
  }
}
