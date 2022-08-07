import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/ui/widgets/custom_list_tile.dart';
import '../../state_m/provider/notifications_list_screen_notifier.dart';

class NotificationsListScreenContent extends StatefulWidget {
  const NotificationsListScreenContent({Key? key}) : super(key: key);
  @override
  State<NotificationsListScreenContent> createState() =>
      _NotificationsListScreenContentState();
}

class _NotificationsListScreenContentState
    extends State<NotificationsListScreenContent> {
  late NotificationsListScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<NotificationsListScreenNotifier>();
    sn.context = context;
    List<String> notifications = [
      "Violence detected!",
      "Several people were recognized.",
      "Warning! Fire detected.",
      "Warning! A new person was detected."
    ];

    List<String> cameraId = [
      "1",
      "21",
      "14",
      "6",
    ];
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: 30,
          right: AppConstants.screenPadding.right,
          left: AppConstants.screenPadding.left,
        ),
        itemBuilder: (context, index) {
          return CustomListTile(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            boxShadow: [
              const BoxShadow(
                color: AppColors.grey500,
                blurRadius: 10,
                offset: Offset(0, 8),
              ),
            ],
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.warning_amber_rounded,
              size: 100.sp,
            ),
            title: Text(
              notifications[index],
              style: TextStyle(
                fontSize: 45.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            titleSubtitleSpacing: 20,
            subtitle: Text(
              "camera id: ${cameraId[index]}",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          );
        },
        separatorBuilder: (_, __) => 40.verticalSpace,
        itemCount: notifications.length,
      ),
    );
  }
}
