import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/more_screen_notifier.dart';
import 'more_screen_content.dart';

class MoreScreenParam {}

class MoreScreen extends BaseScreen<MoreScreenParam> {
  static const String routeName = "/MoreScreen";

  const MoreScreen({
    Key? key,
    required MoreScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  late final MoreScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = MoreScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoreScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: MoreScreenContent(),
      ),
    );
  }
}
