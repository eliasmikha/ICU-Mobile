import 'package:flutter/material.dart';
import 'package:starter_application/core/common/app_colors.dart';

/// This class used to add custom colors for dark and light mode.
@immutable
class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final Color? testButtonColor;
  final Color? textColor;

  CustomThemeColors({
    required this.testButtonColor,
    required this.textColor,
  });

  @override
  CustomThemeColors copyWith({
    Color? testButtonColor,
    Color? textColor,
  }) {
    return CustomThemeColors(
      testButtonColor: testButtonColor ?? this.testButtonColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) {
      return this;
    }
    return CustomThemeColors(
      testButtonColor: Color.lerp(testButtonColor, other.testButtonColor, t),
      textColor: Color.lerp(textColor, other.textColor, t)
    );
  }

  // the light theme
  static final light = CustomThemeColors(
    testButtonColor: Colors.pink,
    textColor: AppColors.textColorLight,
  );

  // the dark theme
  static final dark = CustomThemeColors(
    testButtonColor: Colors.green,
    textColor: AppColors.textColorDark,
  );
}
