import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = HomeScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        // appBar: CustomAppBar(
        //   withLeading: false,
        // ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: HomeScreenContent(),
      ),
    );
  }
}
