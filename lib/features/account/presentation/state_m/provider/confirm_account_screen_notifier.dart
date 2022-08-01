import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/confirm_account/confirm_account_screen.dart';

class ConfirmAccountScreenNotifier extends ScreenNotifier {
  /// Constructors
  ConfirmAccountScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final ConfirmAccountScreenParam param;
  final pinController = TextEditingController();

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    pinController.dispose();
    this.dispose();
  }

  void onResendCodeTap() {
  }
}
