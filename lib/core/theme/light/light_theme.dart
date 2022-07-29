part of '../themes_data.dart';

ThemeData _getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColorLight,
      secondary: AppColors.accentColorLight,
    ),
    fontFamily: LanguageUtils.isLTR(AppConfig().appLanguage.languageCode)
        ? GoogleFonts.poppins().fontFamily
        : GoogleFonts.cairo().fontFamily,
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
    extensions: [CustomThemeColors.light]
  );
}
