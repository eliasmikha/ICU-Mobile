import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../../core/ui/widgets/dropdown/custom_dropdown.dart';
import '../../state_m/provider/add_room_screen_notifier.dart';

class AddRoomScreenContent extends StatefulWidget {
  const AddRoomScreenContent({Key? key}) : super(key: key);
  @override
  State<AddRoomScreenContent> createState() => _AddRoomScreenContentState();
}

class _AddRoomScreenContentState extends State<AddRoomScreenContent> {
  late AddRoomScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<AddRoomScreenNotifier>();
    sn.context = context;
    return Container(
      height: 1.sh,
      width: 1.sw,
      padding: AppConstants.screenPadding,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomDropdown(
              dropdownItems: ["Damascus", "Aleppo"],
              dropdownValue: ValueNotifier(null),
              hint: Text('Select a Room'),
              border: border,
              enabledBorder: border,
              disabledBorder: border,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
            ),
            120.verticalSpace,
            Text('or add a new one'),
            40.verticalSpace,
            CustomTextField(
              textKey: GlobalKey(),
              controller: TextEditingController(),
              focusNode: FocusNode(),
              labelText: 'Room Name',
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
}
