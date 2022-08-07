import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state_m/provider/camera_list_screen_notifier.dart';

class CameraListScreenContent extends StatefulWidget {
  const CameraListScreenContent({Key? key}) : super(key: key);
  @override
  State<CameraListScreenContent> createState() =>
      _CameraListScreenContentState();
}

class _CameraListScreenContentState extends State<CameraListScreenContent> {
  late CameraListScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<CameraListScreenNotifier>();
    sn.context = context;
    return Container();
  }
}
