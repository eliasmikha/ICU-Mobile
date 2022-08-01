import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/home/home_screen.dart';

class HomeScreenNotifier extends ScreenNotifier {
  /// Constructors
  HomeScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final HomeScreenParam param;

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
