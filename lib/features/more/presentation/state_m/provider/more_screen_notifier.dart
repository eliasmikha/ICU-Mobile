import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/more/more_screen.dart';

class MoreScreenNotifier extends ScreenNotifier {
  /// Constructors
  MoreScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final MoreScreenParam param;

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
