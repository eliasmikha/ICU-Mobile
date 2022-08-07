import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/add_branch/add_branch_screen.dart';

class AddBranchScreenNotifier extends ScreenNotifier {
  /// Constructors
  AddBranchScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final AddBranchScreenParam param;

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
