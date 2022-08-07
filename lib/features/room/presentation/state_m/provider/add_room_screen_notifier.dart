import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/add_room/add_room_screen.dart';

class AddRoomScreenNotifier extends ScreenNotifier {
  /// Constructors
  AddRoomScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final AddRoomScreenParam param;

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
