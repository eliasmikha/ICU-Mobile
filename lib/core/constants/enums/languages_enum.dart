import 'package:starter_application/core/constants/app/app_constants.dart';

enum LanguagesEnum { english, arabic, kurdish }

LanguagesEnum mapStringToLanguagesEnum(String language) {
  if (language == AppConstants.LANG_EN) return LanguagesEnum.english;
  if (language == AppConstants.LANG_AR) return LanguagesEnum.arabic;
  if (language == AppConstants.LANG_KU) return LanguagesEnum.kurdish;

  /// Fallback
  return LanguagesEnum.english;
}

String mapLanguageEnumToString(LanguagesEnum language) {
  switch (language) {
    case LanguagesEnum.english:
      return AppConstants.LANG_EN;
    case LanguagesEnum.arabic:
      return AppConstants.LANG_AR;
    case LanguagesEnum.kurdish:
      return AppConstants.LANG_KU;
    default:
      return AppConstants.LANG_EN;
  }
}
