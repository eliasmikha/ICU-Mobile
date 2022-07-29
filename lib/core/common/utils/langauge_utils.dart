import 'package:intl/intl.dart' as intl;
import '../../../generated/l10n.dart' as tran;

class LanguageUtils {
  LanguageUtils._();

  /// util function to know if a certain `languageCode`
  /// is a Right-To-Left language
  static bool isRTL(String languageCode) {
    return intl.Bidi.isRtlLanguage(languageCode);
  }

  /// util function to know if a certain `languageCode`
  /// is a Left-To-Right language
  static bool isLTR(String languageCode) {
    return !intl.Bidi.isRtlLanguage(languageCode);
  }

  tran.S trans() => tran.S.current;
}
