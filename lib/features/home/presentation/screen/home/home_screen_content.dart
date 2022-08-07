import 'dart:ui';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/ui/error_ui/errors_screens/error_widget.dart';
import 'package:starter_application/core/ui/widgets/custom_button.dart';
import 'package:starter_application/core/ui/widgets/custom_image.dart';
import 'package:starter_application/core/ui/widgets/dropdown/custom_dropdown.dart';
import 'package:starter_application/core/ui/widgets/waiting_widget.dart';
import 'package:starter_application/features/camera/presentation/screen/add_camera/add_camera_screen.dart';
import 'package:starter_application/features/camera/presentation/screen/camera_details/camera_details_screen.dart';
import 'package:starter_application/features/camera/presentation/screen/camera_list/camera_list_screen.dart';
import 'package:starter_application/features/camera/presentation/state_m/cubit/camera_cubit.dart';
import 'package:starter_application/features/more/presentation/screen/notifications_list/notifications_list_screen.dart';
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
      child: Column(
        children: [
          Container(
            height: AppConstants.appbarHeight / 1.5,
            color: AppColors.primaryColorLight,
            width: 1.sw,
            padding: AppConstants.screenPadding,
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImage.asset(
                  AppConstants.APP_LOGO,
                ),
                Text(
                  'ICU',
                  style: GoogleFonts.merriweather(
                    fontWeight: FontWeight.bold,
                    fontSize: 80.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Nav.to(
                      NotificationsListScreen.routeName,
                      arguments: NotificationsListScreenParam(),
                    );
                  },
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: 80.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildCamerasList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCamerasList() {
    return BlocBuilder<CameraCubit, CameraState>(
      bloc: sn.cameraCubit,
      builder: (context, state) {
        return state.maybeMap(
          cameraInit: (_) => const WaitingWidget(),
          cameraLoading: (_) => const WaitingWidget(),
          cameraError: (s) => ErrorScreenWidget(
            error: s.error,
            callback: s.callback,
          ),
          camerasListLoaded: (s) {
            if (s.cameraEntity.isEmpty) return _buildEmptyScreen();
            return ListView.separated(
              itemCount: s.cameraEntity.length,
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.screenPadding.left,
                vertical: 20,
              ),
              itemBuilder: (context, index) {
                return Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Nav.to(
                        CameraDetailsScreen.routeName,
                        arguments: CameraDetailsScreenParam(
                          url:
                              'https://drive.google.com/uc?export=download&id=1-vhrJInSz3pL5lKP3P8cdaJciQB23zpV',
                        ),
                      );
                    },
                    child: Container(
                      width: 1.sw,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey500,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: AppColors.grey500.withOpacity(.3),
                            height: 200,
                            child: Center(
                              child: Icon(
                                Icons.panorama_outlined,
                                size: 160.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50.w, vertical: 20.h),
                            child: Text(
                              s.cameraEntity[index].name,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => 60.verticalSpace,
            );
          },
          orElse: () => const ScreenNotImplementedErrorWidget(),
        );
      },
    );
  }

  Widget _buildEmptyScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.add_a_photo_outlined,
          size: 100,
          color: AppColors.grey500,
        ),
        40.verticalSpace,
        Text(
          'You don\'t have any cameras yet.',
          style: TextStyle(
            color: Colors.grey.shade900,
          ),
        ),
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
          onPressed: () {
            Nav.to(
              AddCameraScreen.routeName,
              arguments: AddCameraScreenParam(),
            );
          },
        ),
      ],
    );
  }
}
