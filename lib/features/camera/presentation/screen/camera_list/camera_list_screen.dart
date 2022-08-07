import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/camera_list_screen_notifier.dart';
import 'camera_list_screen_content.dart';

class CameraListScreenParam {}

class CameraListScreen extends BaseScreen<CameraListScreenParam> {
  static const String routeName = "/CameraListScreen";

  const CameraListScreen({
    Key? key,
    required CameraListScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _CameraListScreenState createState() => _CameraListScreenState();
}

class _CameraListScreenState extends State<CameraListScreen> {
  late final CameraListScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = CameraListScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CameraListScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CameraList Screen"),
        ),
        backgroundColor: AppColors.scaffoldColor,
        body: CameraListScreenContent(),
      ),
    );
  }
}
