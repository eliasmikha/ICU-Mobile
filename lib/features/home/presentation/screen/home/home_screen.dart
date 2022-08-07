import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../state_m/provider/home_screen_notifier.dart';
import 'home_screen_content.dart';

class HomeScreenParam {}

class HomeScreen extends BaseScreen<HomeScreenParam> {
  static const String routeName = "/HomeScreen";

  const HomeScreen({
    Key? key,
    required HomeScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final HomeScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = HomeScreenNotifier(widget.param);
    sn.loadCameras();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<HomeScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: HomeScreenContent(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
