import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/ui/widgets/custom_appbar.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/provider/branch_list_screen_notifier.dart';
import 'branch_list_screen_content.dart';

class BranchListScreenParam {}

class BranchListScreen extends BaseScreen<BranchListScreenParam> {
  static const String routeName = "/BranchListScreen";

  const BranchListScreen({
    Key? key,
    required BranchListScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _BranchListScreenState createState() => _BranchListScreenState();
}

class _BranchListScreenState extends State<BranchListScreen>
    with AutomaticKeepAliveClientMixin {
  late final BranchListScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = BranchListScreenNotifier(widget.param);
    sn.loadBranchList();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<BranchListScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Branches',
          withLeading: false,
          appbarHeight: AppConstants.appbarHeight / 1.5,
          // backgroundColor: Colors.transparent,
        ),
        backgroundColor: AppColors.scaffoldColor,
        body: const BranchListScreenContent(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
