import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/add_department/add_department_screen.dart';

class AddDepartmentScreenNotifier extends ScreenNotifier {
  /// Constructors
  AddDepartmentScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final AddDepartmentScreenParam param;

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
