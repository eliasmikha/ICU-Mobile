import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/custom_appbar.dart';
import '../../state_m/provider/notifications_list_screen_notifier.dart';
import 'notifications_list_screen_content.dart';

class NotificationsListScreenParam {}

class NotificationsListScreen extends BaseScreen<NotificationsListScreenParam> {
  static const String routeName = "/NotificationsListScreen";

  const NotificationsListScreen({
    Key? key,
    required NotificationsListScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _NotificationsListScreenState createState() =>
      _NotificationsListScreenState();
}

class _NotificationsListScreenState extends State<NotificationsListScreen> {
  late final NotificationsListScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = NotificationsListScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotificationsListScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Notifications",
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: NotificationsListScreenContent(),
      ),
    );
  }
}
