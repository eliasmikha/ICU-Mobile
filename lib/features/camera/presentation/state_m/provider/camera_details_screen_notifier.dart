import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/camera_details/camera_details_screen.dart';

class CameraDetailsScreenNotifier extends ScreenNotifier {
  /// Constructors
  CameraDetailsScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final CameraDetailsScreenParam param;
  final List<bool> options = List<bool>.generate(5, (index) => false);

  /// Getters and Setters

  /// Methods
  void updateOption(int index, bool value) {
    options[index] = value;
    notifyListeners();
  }

  @override
  void closeNotifier() {
    this.dispose();
  }
}
