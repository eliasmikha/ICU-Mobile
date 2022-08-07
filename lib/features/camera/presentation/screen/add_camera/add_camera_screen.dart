import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../state_m/provider/add_camera_screen_notifier.dart';
import 'add_camera_screen_content.dart';

class AddCameraScreenParam {}

class AddCameraScreen extends BaseScreen<AddCameraScreenParam> {
  static const String routeName = "/AddCameraScreen";

  const AddCameraScreen({
    Key? key,
    required AddCameraScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _AddCameraScreenState createState() => _AddCameraScreenState();
}

class _AddCameraScreenState extends State<AddCameraScreen> {
  late final AddCameraScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = AddCameraScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCameraScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          // backgroundColor: Colors.transparent,
          // withLeadingBackground: true,
          title: "Add a camera",
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AddCameraScreenContent(),
      ),
    );
  }
}
