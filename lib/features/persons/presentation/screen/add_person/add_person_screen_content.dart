import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/constants/enums/gender_enum.dart';
import 'package:starter_application/core/ui/widgets/custom_button.dart';
import 'package:starter_application/core/ui/widgets/custom_list_tile.dart';
import 'package:starter_application/core/ui/widgets/custom_text_field.dart';
import 'package:starter_application/core/ui/widgets/dropdown/custom_dropdown.dart';
import 'package:starter_application/generated/l10n.dart';
import '../../state_m/provider/add_person_screen_notifier.dart';

class AddPersonScreenContent extends StatefulWidget {
  const AddPersonScreenContent({Key? key}) : super(key: key);
  @override
  State<AddPersonScreenContent> createState() => _AddPersonScreenContentState();
}

class _AddPersonScreenContentState extends State<AddPersonScreenContent> {
  late AddPersonScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<AddPersonScreenNotifier>();
    sn.context = context;
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Form(
        key: sn.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: .05.sh,
                ),
                child: Container(
                  height: 300.w,
                  width: 300.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey500),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 100.sp,
                  ),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: AppConstants.screenPadding,
                child: CustomTextField(
                  textKey: sn.nameKey,
                  controller: sn.nameController,
                  focusNode: sn.nameFocusNode,
                  labelText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.current.errorEmptyField;
                    }
                    return null;
                  },
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: AppConstants.screenPadding,
                child: CustomTextField(
                  textKey: sn.ageKey,
                  controller: sn.ageController,
                  focusNode: sn.ageFocusNode,
                  labelText: 'Age',
                  validator: (value) {
                    final age = int.tryParse(value ?? '');
                    if (value == null || value.isEmpty) {
                      return S.current.errorEmptyField;
                    } else if (age == null || age < 18 || age > 100) {
                      return "Please enter a valid age";
                    }
                    return null;
                  },
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: AppConstants.screenPadding,
                child: CustomTextField(
                  textKey: sn.phoneNumberKey,
                  controller: sn.phoneNumberController,
                  focusNode: sn.phoneNumberFocusNode,
                  labelText: 'Phone Number',
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: AppConstants.screenPadding,
                child: CustomDropdown<GenderEnum>(
                  dropdownItems: GenderEnum.values,
                  dropdownValue: sn.gender,
                  stringTitleGetter: (value) {
                    return getStringFromGender(value);
                  },
                  hint: Text('Gender'),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: focusedBorder,
                  disabledBorder: border,
                  focusedErrorBorder: errorBorder,
                  errorBorder: errorBorder,
                  validator: (value) {
                    if (value == null) {
                      return S.current.errorEmptyField;
                    }
                    return null;
                  },
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: AppConstants.screenPadding,
                child: CustomTextField(
                  textKey: sn.positionKey,
                  controller: sn.positionController,
                  focusNode: sn.positionFocusNode,
                  labelText: 'Position',
                ),
              ),
              20.verticalSpace,
              Builder(
                builder: (context) {
                  context
                      .select<AddPersonScreenNotifier, DateTime?>((p) => p.dob);
                  return Padding(
                    padding: AppConstants.screenPadding,
                    child: CustomListTile(
                      key: sn.dobKey,
                      border: Border.all(
                        color: AppColors.grey500,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      title: Text(
                        sn.dob == null
                            ? "Date of Birth"
                            : DateFormat('dd / MMM / yyyy').format(sn.dob!),
                      ),
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      trailingAlignment: AlignmentDirectional.centerEnd,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: sn.dob ?? DateTime(2000, 1, 1),
                          firstDate: DateTime(1920, 1, 1),
                          lastDate: DateTime(2005, 1, 1),
                          initialDatePickerMode: DatePickerMode.day,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );
      
                        sn.dob = date ?? sn.dob;
                      },
                    ),
                  );
                },
              ),
              60.verticalSpace,
              Padding(
                padding: AppConstants.screenPadding,
                child: CustomButton(
                  titleText: 'Add Person',
                  fixedSize: Size(1.sw, 60),
                  borderRadius: Radius.zero,
                  onPressed: sn.addPerson,
                ),
              ),
              120.verticalSpace,
            ],
          ),
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
