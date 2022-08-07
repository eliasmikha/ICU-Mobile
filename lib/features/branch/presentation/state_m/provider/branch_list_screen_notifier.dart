import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/params/id_param.dart';
import 'package:starter_application/features/account/presentation/state_m/provider/profile_notifier.dart';
import 'package:starter_application/features/branch/presentation/state_m/cubit/branch_cubit.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/branch_list/branch_list_screen.dart';

class BranchListScreenNotifier extends ScreenNotifier {
  /// Constructors
  BranchListScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final BranchListScreenParam param;
  final branchCubit = BranchCubit();

  /// Getters and Setters

  /// Methods
  void loadBranchList() {
    final id = LocalStorage.profile?.id;
    branchCubit.getBranchesList(IdParam(int.tryParse(id ?? '') ?? -1));
  }

  @override
  void closeNotifier() {
    branchCubit.close();
    this.dispose();
  }
}
