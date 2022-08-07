import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/add_camera/add_camera_screen.dart';

class AddCameraScreenNotifier extends ScreenNotifier {
  /// Constructors
  AddCameraScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final AddCameraScreenParam param;
  int _selectedPage = 0;
  final pageController = PageController();

  /// Getters and Setters
  int get selectedPage => _selectedPage;
  set selectedPage(int value) {
    _selectedPage = value;
    notifyListeners();
  }

  /// Methods

  @override
  void closeNotifier() {
    pageController.dispose();
    this.dispose();
  }
}
