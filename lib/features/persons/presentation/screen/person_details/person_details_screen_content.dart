import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/ui/widgets/custom_image.dart';
import 'package:starter_application/core/ui/widgets/custom_list_tile.dart';
import '../../state_m/provider/person_details_screen_notifier.dart';

class PersonDetailsScreenContent extends StatefulWidget {
  const PersonDetailsScreenContent({Key? key}) : super(key: key);
  @override
  State<PersonDetailsScreenContent> createState() =>
      _PersonDetailsScreenContentState();
}

class _PersonDetailsScreenContentState
    extends State<PersonDetailsScreenContent> {
  late PersonDetailsScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<PersonDetailsScreenNotifier>();
    sn.context = context;
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Column(
        children: [
          Builder(builder: (context) {
            context.select<PersonDetailsScreenNotifier, File?>((p) => p.image);
            return SizedBox(
              width: 1.sw,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  sn.image == null
                      ? CustomListTile(
                          width: 400.w,
                          height: 400.w,
                          border: Border.all(color: AppColors.grey500),
                          borderRadius: BorderRadius.circular(100),
                          title: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 120.sp,
                                ),
                                Text(
                                  'click to upload',
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          onTap: sn.pickImage,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.grey.shade300,
                            ],
                          ),
                        )
                      : ClipOval(
                          child: CustomImage.file(
                            sn.image!,
                            width: 400.w,
                            height: 400.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                ],
              ),
            );
          }),
          Expanded(
            child: SingleChildScrollView(
              padding: AppConstants.screenPadding,
              child: Column(
                children: [
                  _buildDetails('Name', sn.param.person.name),
                  _buildDetails('Age', sn.param.person.age?.toString() ?? ''),
                  if (sn.param.person.dob != null)
                    _buildDetails(
                      'Date of birth',
                      DateFormat('dd/MMM/yyyy').format(
                        sn.param.person.dob!,
                      ),
                    ),
                  _buildDetails(
                    'First seen',
                    DateFormat('dd/MMM/yyyy HH:mm a').format(
                      sn.param.person.createdAt ?? DateTime(2022, 6, 5, 15, 40),
                    ),
                  ),
                  _buildDetails(
                    'Last seen',
                    DateFormat('dd/MMM/yyyy HH:mm a').format(
                      sn.param.person.updatedAt ?? DateTime(2022, 8, 7, 12, 10),
                    ),
                  ),
                  _buildDetails(
                    'Last known location',
                    'camera: ${sn.param.person.detectedBycamId ?? -1}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(String title, String content) {
    return CustomListTile(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      leadingFlex: 5,
      leading: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          title + ':',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(content),
    );
  }
}
