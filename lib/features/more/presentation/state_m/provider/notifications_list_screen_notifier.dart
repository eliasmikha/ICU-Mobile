import 'package:flutter/material.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../screen/notifications_list/notifications_list_screen.dart';

class NotificationsListScreenNotifier extends ScreenNotifier {
  /// Constructors
  NotificationsListScreenNotifier(this.param);

  /// Fields
  late BuildContext context;
  final NotificationsListScreenParam param;

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
