import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/add_department_screen_notifier.dart';
import 'add_department_screen_content.dart';

class AddDepartmentScreenParam {}

class AddDepartmentScreen extends BaseScreen<AddDepartmentScreenParam> {
  static const String routeName = "/AddDepartmentScreen";

  const AddDepartmentScreen({
    Key? key,
    required AddDepartmentScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _AddDepartmentScreenState createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> {
  late final AddDepartmentScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = AddDepartmentScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddDepartmentScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AddDepartmentScreenContent(),
      ),
    );
  }
}
