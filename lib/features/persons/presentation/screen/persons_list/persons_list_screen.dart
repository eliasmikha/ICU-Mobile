import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/persons_list_screen_notifier.dart';
import 'persons_list_screen_content.dart';

class PersonsListScreenParam {}

class PersonsListScreen extends BaseScreen<PersonsListScreenParam> {
  static const String routeName = "/PersonsListScreen";

  const PersonsListScreen({
    Key? key,
    required PersonsListScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _PersonsListScreenState createState() => _PersonsListScreenState();
}

class _PersonsListScreenState extends State<PersonsListScreen>
    with AutomaticKeepAliveClientMixin {
  late final PersonsListScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = PersonsListScreenNotifier(widget.param);
    sn.loadPersons();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<PersonsListScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: PersonsListScreenContent(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
