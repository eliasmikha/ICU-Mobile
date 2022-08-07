import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/add_room_screen_notifier.dart';
import 'add_room_screen_content.dart';

class AddRoomScreenParam {}

class AddRoomScreen extends BaseScreen<AddRoomScreenParam> {
  static const String routeName = "/AddRoomScreen";

  const AddRoomScreen({
    Key? key,
    required AddRoomScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  late final AddRoomScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = AddRoomScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddRoomScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AddRoomScreenContent(),
      ),
    );
  }
}
