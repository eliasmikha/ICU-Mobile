import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/camera_list/camera_list_screen.dart';

class CameraListScreenNotifier extends ScreenNotifier {
  /// Constructors
  CameraListScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final CameraListScreenParam param;

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
