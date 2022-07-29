import 'package:flutter/material.dart';

/// This class used to add custom colors for dark and light mode.
@immutable
class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final Color? testButtonColor;

  CustomThemeColors({
    required this.testButtonColor,
  });

  @override
  CustomThemeColors copyWith({
    Color? testButtonColor,
  }) {
    return CustomThemeColors(
      testButtonColor: testButtonColor ?? this.testButtonColor,
    );
  }

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) {
      return this;
    }
    return CustomThemeColors(
      testButtonColor: Color.lerp(testButtonColor, other.testButtonColor, t),
    );
  }

  // the light theme
  static final light = CustomThemeColors(
    testButtonColor: Colors.pink,
  );

  // the dark theme
  static final dark = CustomThemeColors(
    testButtonColor: Colors.green,
  );
}
