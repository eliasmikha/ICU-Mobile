import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starter_application/core/common/app_colors.dart';
import 'package:starter_application/core/common/app_config.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';
import 'package:starter_application/core/theme/text_theme_styles.dart';

import 'custom_theme_colors.dart';

import '../common/utils/langauge_utils.dart';

part 'light/light_theme.dart';
part 'dark/dark_theme.dart';

class ThemesData {
  static ThemeData get lightTheme => _getLightTheme();
  static ThemeData get darkTheme => _getDarkTheme();
}
