import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/ui/widgets/custom_button.dart';
import 'package:starter_application/features/branch/presentation/screen/add_branch/add_branch_screen_content.dart';
import 'package:starter_application/features/department/presentation/screen/add_department/add_department_screen.dart';
import 'package:starter_application/features/room/presentation/screen/add_room/add_room_screen_content.dart';
import 'package:timelines/timelines.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../../core/ui/widgets/dropdown/custom_dropdown.dart';
import '../../../../branch/presentation/screen/add_branch/add_branch_screen.dart';
import '../../../../room/presentation/screen/add_room/add_room_screen.dart';
import '../../state_m/provider/add_camera_screen_notifier.dart';

const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class AddCameraScreenContent extends StatefulWidget {
  @override
  _AddCameraScreenContentState createState() => _AddCameraScreenContentState();
}

class _AddCameraScreenContentState extends State<AddCameraScreenContent> {
  late AddCameraScreenNotifier sn;

  int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    sn = context.read<AddCameraScreenNotifier>();
    sn.context = context;

    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 200,
                  child: Timeline.tileBuilder(
                    theme: TimelineThemeData(
                      direction: Axis.horizontal,
                      connectorTheme: const ConnectorThemeData(
                        space: 30.0,
                        thickness: 5.0,
                      ),
                    ),
                    builder: TimelineTileBuilder.connected(
                      connectionDirection: ConnectionDirection.before,
                      itemExtentBuilder: (_, __) => 1.sw / _processes.length,
                      oppositeContentsBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Icon(
                            _icons[index],
                            size: 50.0,
                            color: getColor(index),
                          ),
                        );
                      },
                      contentsBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            _processes[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getColor(index),
                            ),
                          ),
                        );
                      },
                      indicatorBuilder: (_, index) {
                        var color;
                        var child;
                        if (index == _processIndex) {
                          color = inProgressColor;
                          // child = const Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: CircularProgressIndicator(
                          //     strokeWidth: 3.0,
                          //     valueColor: AlwaysStoppedAnimation(Colors.white),
                          //   ),
                          // );
                        } else if (index < _processIndex) {
                          color = completeColor;
                          child = const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15.0,
                          );
                        } else {
                          color = todoColor;
                        }

                        if (index <= _processIndex) {
                          return Stack(
                            children: [
                              CustomPaint(
                                size: Size(30.0, 30.0),
                                painter: _BezierPainter(
                                  color: color,
                                  drawStart: index > 0,
                                  drawEnd: index < _processIndex,
                                ),
                              ),
                              DotIndicator(
                                size: 30.0,
                                color: color,
                                child: child,
                              ),
                            ],
                          );
                        } else {
                          return Stack(
                            children: [
                              CustomPaint(
                                size: Size(15.0, 15.0),
                                painter: _BezierPainter(
                                  color: color,
                                  drawEnd: index < _processes.length - 1,
                                ),
                              ),
                              OutlinedDotIndicator(
                                borderWidth: 4.0,
                                color: color,
                              ),
                            ],
                          );
                        }
                      },
                      connectorBuilder: (_, index, type) {
                        if (index > 0) {
                          if (index == _processIndex) {
                            final prevColor = getColor(index - 1);
                            final color = getColor(index);
                            List<Color> gradientColors;
                            if (type == ConnectorType.start) {
                              gradientColors = [
                                Color.lerp(prevColor, color, 0.5)!,
                                color
                              ];
                            } else {
                              gradientColors = [
                                prevColor,
                                Color.lerp(prevColor, color, 0.5)!
                              ];
                            }
                            return DecoratedLineConnector(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors,
                                ),
                              ),
                            );
                          } else {
                            return SolidLineConnector(
                              color: getColor(index),
                            );
                          }
                        } else {
                          return null;
                        }
                      },
                      itemCount: _icons.length,
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: sn.pageController,
                    children: [
                      AddBranchScreen(param: AddBranchScreenParam()),
                      AddDepartmentScreen(param: AddDepartmentScreenParam()),
                      AddRoomScreen(param: AddRoomScreenParam()),
                      _buildAddCamera(),
                    ],
                    onPageChanged: (page) {
                      setState(() {
                        _processIndex = page;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: AppConstants.screenPadding.left,
            right: AppConstants.screenPadding.right,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  fixedSize: Size(.4.sw, 55),
                  titleText: 'Cancel',
                  backgroundColor: Colors.grey,
                  onPressed: Nav.pop,
                ),
                CustomButton(
                  fixedSize: Size(.4.sw, 55),
                  titleText:
                      _processIndex == _processes.length - 1 ? "Add" : 'Next',
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    sn.pageController.animateToPage(
                      _processIndex + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCamera() {
    return Container(
      height: 1.sh,
      width: 1.sw,
      padding: AppConstants.screenPadding,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            40.verticalSpace,
            CustomTextField(
              textKey: GlobalKey(),
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: 'Camera Name',
            ),
            40.verticalSpace,
            CustomTextField(
              textKey: GlobalKey(),
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: 'Camera Url',
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder get border => const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: AppColors.grey500,
          width: 2,
        ),
      );

  OutlineInputBorder get errorBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        ),
      );

  OutlineInputBorder get focusedBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: AppColors.blue500,
          width: 2,
        ),
      );

  final _processes = [
    'Branch',
    'Department',
    'Room',
    'Camera',
  ];

  final _icons = [
    Icons.location_city_outlined,
    Icons.corporate_fare_outlined,
    Icons.meeting_room_outlined,
    Icons.add_a_photo_outlined,
  ];
}

/// hardcoded bezier painter
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}
