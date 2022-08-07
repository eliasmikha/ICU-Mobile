import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/ui/widgets/custom_switch.dart';
import 'package:video_player/video_player.dart';
import '../../state_m/provider/camera_details_screen_notifier.dart';

class CameraDetailsScreenContent extends StatefulWidget {
  final String url;
  const CameraDetailsScreenContent({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  State<CameraDetailsScreenContent> createState() =>
      _CameraDetailsScreenContentState();
}

class _CameraDetailsScreenContentState
    extends State<CameraDetailsScreenContent> {
  late CameraDetailsScreenNotifier sn;

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late Chewie playerWidget;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.url);

    videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );

    playerWidget = Chewie(
      controller: chewieController,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sn = context.read<CameraDetailsScreenNotifier>();
    sn.context = context;
    List<String> services = [
      'Motion Detection',
      'Theft Detection',
      'Face Recognition',
      'Fall Detection',
      'Violence Detection',
    ];
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Column(
        children: [
          _buildCamera(),
          80.verticalSpace,
          Text(
            'AI services options',
            style: TextStyle(
              fontSize: 60.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          80.verticalSpace,
          Expanded(
            child: ListView.separated(
              padding: AppConstants.screenPadding,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Builder(builder: (context) {
                          context.select<CameraDetailsScreenNotifier, bool>(
                            (p) => p.options[index],
                          );
                          return CustomSwitch(
                            value: sn.options[index],
                            onChanged: (value) {
                              sn.updateOption(index, value);
                            },
                          );
                        }),
                      ),
                    ),
                    40.horizontalSpace,
                    Text(
                      services[index],
                      style: TextStyle(
                        fontSize: 50.sp,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (_, __) => 40.verticalSpace,
              itemCount: services.length,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCamera() {
    return Container(
      color: Colors.black12,
      height: 250,
      width: 1.sw,

      child: playerWidget,

      // Positioned.fill(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       const Expanded(child: SizedBox.shrink()),
      //       Expanded(
      //         child: Center(
      //           child: Icon(
      //             Icons.pause,
      //             color: AppColors.grey500,
      //             size: 100.sp,
      //           ),
      //         ),
      //       ),
      //       const Expanded(
      //         child: Align(
      //           alignment: Alignment.bottomRight,
      //           child: Padding(
      //             padding: EdgeInsets.all(10),
      //             child: Icon(
      //               Icons.fullscreen_rounded,
      //               color: AppColors.grey500,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
