import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/add_branch_screen_notifier.dart';
import 'add_branch_screen_content.dart';

class AddBranchScreenParam {}

class AddBranchScreen extends BaseScreen<AddBranchScreenParam> {
  static const String routeName = "/AddBranchScreen";

  const AddBranchScreen({
    Key? key,
    required AddBranchScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _AddBranchScreenState createState() => _AddBranchScreenState();
}

class _AddBranchScreenState extends State<AddBranchScreen> {
  late final AddBranchScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = AddBranchScreenNotifier(widget.param);
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBranchScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const AddBranchScreenContent(),
      ),
    );
  }
}
