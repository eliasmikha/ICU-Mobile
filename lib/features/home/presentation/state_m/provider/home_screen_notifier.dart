import 'package:flutter/material.dart';
import 'package:starter_application/features/camera/presentation/state_m/cubit/camera_cubit.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/home/home_screen.dart';

class HomeScreenNotifier extends ScreenNotifier {
  /// Constructors
  HomeScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final HomeScreenParam param;
  final cameraCubit = CameraCubit();

  /// Getters and Setters

  /// Methods
  void loadCameras() {
    cameraCubit.getAllCameras();
  }

  @override
  void closeNotifier() {
    cameraCubit.close();
    this.dispose();
  }
}
