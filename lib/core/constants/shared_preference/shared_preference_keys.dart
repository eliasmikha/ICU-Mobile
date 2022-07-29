import 'package:flutter/foundation.dart';

@immutable
class SharedPreferenceKeys {
  static const KEY_LANGUAGE = 'language';
  static const KEY_TOKEN = 'token';
  static const KEY_FIREBASE_TOKEN = 'firebase_token';
  static const KEY_OLD_FIREBASE_TOKEN = 'old_firebase_token';
  static const KEY_FIRST_START = 'First_start';
  static const KEY_APP_THEME = 'appTheme';

  static const REMOVE_KEYS_ON_LOGOUT = const [
    KEY_TOKEN,
    KEY_FIREBASE_TOKEN,
    KEY_OLD_FIREBASE_TOKEN,
  ];
}
