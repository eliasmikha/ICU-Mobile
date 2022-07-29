import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size? fixedSize;
  final Widget? title;
  final String? titleText;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final Color primary;
  final Color shadowColor;
  final Color? textColor;
  final double elevation;
  final Radius borderRadius;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    Key? key,
    this.fixedSize,
    this.title,
    this.titleText,
    this.textStyle,
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.transparent,
    this.primary = Colors.white,
    this.shadowColor = Colors.transparent,
    this.textColor,
    this.elevation = 0.0,
    this.borderRadius = const Radius.circular(10.0),
    this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (fixedSize?.width ?? 0) > 0 ? fixedSize?.width : null,
      height: (fixedSize?.height ?? 0) > 0 ? fixedSize?.height : null,
      child: TextButton(
        onPressed: onPressed,
        child: FittedBox(
          child: title ??
              Text(
                titleText ?? '',
                style: textStyle ??
                    TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: textColor ?? Colors.white,
                    ),
              ),
        ),
        style: TextButton.styleFrom(
          padding: padding,
          primary: primary,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          side: BorderSide(
            color: borderColor,
            width: 1.5,
            style: BorderStyle.solid,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(borderRadius),
          ),
        ),
      ),
    );
  }
}
