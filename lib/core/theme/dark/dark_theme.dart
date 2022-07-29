part of '../themes_data.dart';

ThemeData _getDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primaryColorDark,
      secondary: AppColors.accentColorDark,
    ),
    fontFamily: LanguageUtils.isLTR(AppConfig().appLanguage.languageCode)
        ? GoogleFonts.poppins().fontFamily
        : AppConfig().appLanguage.toString() == AppConstants.LANG_AR
            ? GoogleFonts.cairo().fontFamily
            : GoogleFonts.notoNaskhArabic().fontFamily,
    textTheme: TextTheme(
      headline1: TextThemeStyles.headline1,
      headline2: TextThemeStyles.headline2,
      headline3: TextThemeStyles.headline3,
      headline4: TextThemeStyles.headline4,
      headline5: TextThemeStyles.headline5,
      headline6: TextThemeStyles.headline6,
      subtitle1: TextThemeStyles.subtitle1,
      subtitle2: TextThemeStyles.subtitle2,
      bodyText1: TextThemeStyles.bodyText1,
      bodyText2: TextThemeStyles.bodyText2,
      caption: TextThemeStyles.caption,
      button: TextThemeStyles.button,
      overline: TextThemeStyles.overline,
    ),
    extensions: [CustomThemeColors.dark],
  );
}
