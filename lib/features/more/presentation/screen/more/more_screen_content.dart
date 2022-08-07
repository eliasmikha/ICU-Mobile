import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/common/utils/utils.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/ui/widgets/custom_list_tile.dart';
import '../../state_m/provider/more_screen_notifier.dart';

class MoreScreenContent extends StatefulWidget {
  const MoreScreenContent({Key? key}) : super(key: key);
  @override
  State<MoreScreenContent> createState() => _MoreScreenContentState();
}

class _MoreScreenContentState extends State<MoreScreenContent> {
  late MoreScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<MoreScreenNotifier>();
    sn.context = context;
    return Container(
      height: 1.sh,
      width: 1.sw,
      padding: AppConstants.screenPadding,
      child: Column(
        children: [
          // Profile
          _buildItem(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {},
          ),

          // Explore
          _buildItem(
            icon: Icons.explore_outlined,
            title: 'Explore',
            onTap: () {},
          ),

          // Follow Us
          _buildItem(
            icon: Icons.question_answer,
            title: 'Follow Us',
            onTap: () {},
          ),

          // FAQs
          _buildItem(
            icon: Icons.help_outline_outlined,
            title: 'FAQs',
            onTap: () {},
          ),

          // Report an issue
          _buildItem(
            icon: Icons.bug_report_outlined,
            title: 'Report an Issue',
            onTap: () {},
          ),

          // About Us
          _buildItem(
            icon: Icons.info_outline,
            title: 'About Us',
            onTap: () {},
          ),

          // Logout
          _buildItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              Utils.logout();
            },
            withTrailing: false,
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String title,
    required void Function()? onTap,
    bool withTrailing = true,
  }) {
    return Column(
      children: [
        CustomListTile(
          height: 80,
          width: 1.sw,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            // horizontal: 20,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 50.sp,
            ),
          ),
          leading: Icon(
            icon,
            size: 80.sp,
            color: AppColors.primaryColor,
          ),
          onTap: onTap,
          trailing: withTrailing
              ? const Icon(
                  Icons.arrow_forward_ios_rounded,
                )
              : null,
        ),
        const Divider(
          height: 0,
          color: AppColors.grey500,
          thickness: 2,
        ),
      ],
    );
  }
}
