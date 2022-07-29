import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/generated/l10n.dart';

class OTPWidget extends StatelessWidget {
  /// userIdentifier represent Phone number or Email.
  final String userIdentifier;
  final Function(String) onChangeCode;
  final Function() onResendCodeTap;
  final Function() onConfirmButtonTap;

  const OTPWidget({
    Key? key,
    required this.userIdentifier,
    required this.onChangeCode,
    required this.onResendCodeTap,
    required this.onConfirmButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // verification text
        _buildVerificationText(),
        100.verticalSpace,

        // enter code text
        Align(alignment: Alignment.center, child: _buildEnterCodeText()),
        100.verticalSpace,

        // pin code
        _buildPinCodeTextField(),
        Align(alignment: Alignment.center, child: _buildResendCodeText()),
        250.verticalSpace,

        // confirm button
        _buildConfirmButton(),
      ],
    );
  }

  Text _buildVerificationText() {
    return Text(
      S.current.verification,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55.sp),
    );
  }

  Text _buildEnterCodeText() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: S.current.enterCodeText),
          TextSpan(
            text: "\n${userIdentifier}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      style: TextStyle(fontSize: 40.sp),
      textAlign: TextAlign.center,
    );
  }

  Text _buildResendCodeText() {
    return Text.rich(
      TextSpan(
        text: S.current.resendCode,
        recognizer: TapGestureRecognizer()..onTap = onResendCodeTap,
      ),
      style: TextStyle(color: Colors.grey.shade500, fontSize: 40.sp),
    );
  }

  PinCodeTextField _buildPinCodeTextField() {
    return PinCodeTextField(
      autoFocus: true,
      length: AppConstants.OTP_LENGTH,
      appContext: AppConfig().appContext!,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        inactiveColor: Colors.grey.shade200,
        activeColor: Colors.blue.shade400,
        selectedColor: Colors.blue.shade100,
      ),
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      onChanged: onChangeCode,
      errorTextSpace: 24,
      errorTextDirection:
          AppConfig().appLanguage.languageCode == AppConstants.LANG_EN
              ? TextDirection.ltr
              : TextDirection.rtl,
    );
  }

  Widget _buildConfirmButton() {
    return Ink(
      width: 1.0.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.blue.shade900,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onConfirmButtonTap,
        splashColor: Colors.white30,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            S.current.confirm.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
