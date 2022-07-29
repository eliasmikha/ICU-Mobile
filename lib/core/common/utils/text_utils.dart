import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app/app_constants.dart';
import '../app_config.dart';

class TextUtils{
  TextUtils._();
  /// util function to get the size of a text
static Size getTextSize(
  String text,
  TextStyle style, {
  double minWidth = 0,
  double maxWidth = double.infinity,
  int? maxLines = null,
}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: style.copyWith(
        fontFamily: style.fontFamily ??
            (AppConfig()
                    .appLanguage
                    .languageCode
                    .startsWith(AppConstants.LANG_EN)
                ? GoogleFonts.poppins().fontFamily
                : AppConfig().appLanguage.languageCode == AppConstants.LANG_AR
                    ? GoogleFonts.cairo().fontFamily
                    : GoogleFonts.notoNaskhArabic().fontFamily),
      ),
    ),
    maxLines: maxLines,
    textDirection:
        AppConfig().appLanguage.languageCode.startsWith(AppConstants.LANG_EN)
            ? TextDirection.ltr
            : TextDirection.rtl,
    textScaleFactor: MediaQuery.of(AppConfig().appContext!).textScaleFactor,
  )..layout(minWidth: minWidth, maxWidth: maxWidth);
  return textPainter.size;
}
}