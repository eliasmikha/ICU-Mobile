import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_application/core/common/app_config.dart';

import '../../common/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.textKey,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType,
    required this.labelText,
    this.textInputAction,
    this.isPassword = false,
    this.isConfirmPassword = false,
    this.suffixIcon,
  }) : super(key: key);

  final GlobalKey<FormFieldState<String>> textKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged, onFieldSubmitted;
  final String labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isPassword, isConfirmPassword;
  final Widget? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      key: widget.textKey,
      controller: widget.controller,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 50.h,
          horizontal: 50.w,
        ),
        labelText: widget.labelText,
        labelStyle: themeData.textTheme.labelMedium?.copyWith(
          color: Colors.grey.shade800,
          fontSize: 40.sp,
        ),
        errorMaxLines: 2,
        suffixIcon: widget.suffixIcon == null
            ? widget.isPassword && !widget.isConfirmPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: themeData.buttonTheme.colorScheme!.secondary,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null
            : widget.suffixIcon,
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
      ),
      style: AppConfig().themeData.textTheme.bodyText1?.copyWith(
            fontSize: 50.sp,
            fontWeight: FontWeight.bold,
          ),
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
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
