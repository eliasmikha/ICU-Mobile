import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/theme/custom_theme_colors.dart';
import '../../state_m/provider/confirm_account_screen_notifier.dart';

class ConfirmAccountScreenContent extends StatefulWidget {
  const ConfirmAccountScreenContent({Key? key}) : super(key: key);
  @override
  State<ConfirmAccountScreenContent> createState() =>
      _ConfirmAccountScreenContentState();
}

class _ConfirmAccountScreenContentState
    extends State<ConfirmAccountScreenContent> {
  late ConfirmAccountScreenNotifier sn;
  @override
  Widget build(BuildContext context) {
    sn = context.read<ConfirmAccountScreenNotifier>();
    sn.context = context;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Theme.of(context).extension<CustomThemeColors>()!.textColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade700,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Theme.of(context).colorScheme.secondary,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: (Theme.of(context).brightness) == Brightness.light
            ? Colors.white
            : Colors.black,
      ),
    );

    return Container(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        padding: AppConstants.screenPadding,
        child: Column(
          children: [
            128.verticalSpace,
            Text(
              'Enter the code sent to the email',
            ),
            32.verticalSpace,
            Text(
              sn.param.email,
            ),
            128.verticalSpace,
            Pinput(
              controller: sn.pinController,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (value) {
                if (value == null || value != '111111') {
                  return "wrong code";
                }
              },
            ),
            128.verticalSpace,
            Text(
              "Didn't receive code?",
            ),
            10.verticalSpace,
            Text.rich(
              TextSpan(
                text: "Resend Code",
                recognizer: TapGestureRecognizer()..onTap = sn.onResendCodeTap,
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
