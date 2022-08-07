import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/ui/error_ui/errors_screens/error_widget.dart';
import 'package:starter_application/core/ui/widgets/custom_list_tile.dart';
import 'package:starter_application/core/ui/widgets/waiting_widget.dart';
import 'package:starter_application/features/branch/presentation/state_m/cubit/branch_cubit.dart';
import '../../../domain/entity/branches_entity.dart';
import '../../state_m/provider/branch_list_screen_notifier.dart';

class BranchListScreenContent extends StatefulWidget {
  const BranchListScreenContent({Key? key}) : super(key: key);
  @override
  State<BranchListScreenContent> createState() =>
      _BranchListScreenContentState();
}

class _BranchListScreenContentState extends State<BranchListScreenContent> {
  late BranchListScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<BranchListScreenNotifier>();
    sn.context = context;
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: BlocBuilder<BranchCubit, BranchState>(
        bloc: sn.branchCubit,
        builder: (context, state) {
          return state.maybeMap(
            branchInit: (_) => const WaitingWidget(),
            branchLoading: (_) => const WaitingWidget(),
            branchError: (s) => ErrorScreenWidget(
              error: s.error,
              callback: s.callback,
            ),
            branchListLoaded: (s) => _buildBranches(s.branchEntity.branches),
            orElse: () => const ScreenNotImplementedErrorWidget(),
          );
        },
      ),
    );
  }

  Widget _buildBranches(List<BranchesEntity> branches) {
    return ListView.separated(
      padding: AppConstants.screenPadding,
      itemBuilder: (context, index) {
        final branch = branches[index];
        return CustomListTile(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 5,
          ),
          backgroundColor: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey500,
              blurRadius: 10,
            ),
          ],
          leading: CircleAvatar(
            radius: 30,
            child: Text('ID: ' + (branch.id?.toString() ?? '')),
          ),
          title: Text(branch.name),
          subtitle: Text(branch.location),
        );
      },
      separatorBuilder: (_, __) => 40.verticalSpace,
      itemCount: branches.length,
    );
  }
}
