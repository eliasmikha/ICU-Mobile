import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/firebase/firebase_messaging.dart';
import 'package:starter_application/core/ui/error_ui/error_viewer/error_viewer.dart';
import 'package:starter_application/core/ui/widgets/restart_widget.dart';
import 'package:starter_application/core/ui/widgets/system/double_tap_back_exit_app.dart';
import 'package:starter_application/features/account/presentation/state_m/cubit/account_cubit.dart';
import 'package:starter_application/features/home/presentation/screen/home/home_screen.dart';
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
      builder: (context, child) {
        // listen to isLoading state.
        context.select<AppMainScreenNotifier, bool>((p) => p.isLoading);

        return DoubleTapBackExitApp(
          child: ModalProgressHUD(
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
              child: Builder(
                builder: (context) {
                  context.select<AppMainScreenNotifier, int>(
                      (p) => p.selectedPage);
                  return Scaffold(
                    backgroundColor:
                        AppConfig().themeData.scaffoldBackgroundColor,
                    body: Container(
                      height: 1.sh,
                      width: 1.sw,
                      child: PageView(
                        controller: sn.pageController,
                        children: [
                          HomeScreen(param: HomeScreenParam()),
                          const Center(child: Text('Branches')),
                          const Center(child: Text('Persons')),
                          const Center(child: Text('Settings')),
                        ],
                      ),
                    ),
                    bottomNavigationBar: SizedBox(
                      height: AppConstants.navbarHeight,
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        onTap: (index) {
                          sn.pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                          sn.selectedPage = index;
                        },
                        currentIndex: sn.selectedPage,
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home,
                            ),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.location_city_rounded,
                            ),
                            label: 'Branches',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.person,
                            ),
                            label: "Persons",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.settings,
                            ),
                            label: "Settings",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
