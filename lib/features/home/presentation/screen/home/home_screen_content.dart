import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/ui/widgets/custom_button.dart';
import '../../state_m/provider/home_screen_notifier.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);
  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  late HomeScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<HomeScreenNotifier>();
    sn.context = context;
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: _buildEmptyScreen(),
    );
  }

  Widget _buildEmptyScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.camera),
        Text('you don\'t have any cameras yet!'),
        20.verticalSpace,
        CustomButton(
          title: Row(
            children: [
              const Icon(
                Icons.add_rounded,
                color: Colors.black,
              ),
              20.horizontalSpace,
              Text(
                'Add a Camera',
                style: AppConfig().themeData.textTheme.button,
              ),
            ],
          ),
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          borderRadius: const Radius.circular(100),
        ),
      ],
    );
  }
}
