import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/ui/widgets/custom_appbar.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/camera_details_screen_notifier.dart';
import 'camera_details_screen_content.dart';

class CameraDetailsScreenParam {
  final String url;

  const CameraDetailsScreenParam({required this.url});
}

class CameraDetailsScreen extends BaseScreen<CameraDetailsScreenParam> {
  static const String routeName = "/CameraDetailsScreen";

  const CameraDetailsScreen({
    Key? key,
    required CameraDetailsScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _CameraDetailsScreenState createState() => _CameraDetailsScreenState();
}

class _CameraDetailsScreenState extends State<CameraDetailsScreen> {
  late final CameraDetailsScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = CameraDetailsScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CameraDetailsScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Meetings room',
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: CameraDetailsScreenContent(
          url: sn.param.url,
        ),
      ),
    );
  }
}
