import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_application/core/ui/screens/base_screen.dart';
import 'package:starter_application/core/ui/widgets/system/double_tap_back_exit_app.dart';
import 'package:starter_application/features/home/presentation/screen/home_screen/home_screen_mobile.dart';
import 'package:starter_application/features/home/presentation/screen/home_screen/home_screen_tablet.dart';
import 'package:starter_application/features/home/presentation/state_m/cubit/home_cubit.dart';
import 'package:starter_application/features/home/presentation/state_m/provider/home_screen_notifier.dart';

class HomeScreenParam {}

class HomeScreen extends BaseScreen<HomeScreenParam> {
  static const routeName = "/HomeScreen";

  HomeScreen({required HomeScreenParam param, Key? key})
      : super(param: param, key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final provider = HomeScreenNotifier();
  @override
  void initState() {
    super.initState();
   
  }

  @override
  void dispose() {
    provider.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, _) {
        return ChangeNotifierProvider<HomeScreenNotifier>.value(
          value: provider,
          child: DoubleTapBackExitApp(
            child: BlocListener<HomeCubit, HomeState>(
              bloc: provider.homeCubit,
              listener: (context, state) {
                state.when(
                  homeInitState: () {},
                  homeLoadingState: provider.homeLoadingStateListener,
                  homeLoadedState: (s) {
                    provider.homeLoadedStateListener(s);
                  },
                  homeErrorState: (error, callback) {
                    provider.homeErrorStateListener(context, error, callback);
                  },
                  peopleListLoadedState: (data) {},
                  commentsLoadedState: (_) {},
                );
              },
              child: ScreenTypeLayout(
                mobile: const HomeScreenMobile(),
                tablet: const HomeScreenTablet(),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Widget

  /// Logic

}
