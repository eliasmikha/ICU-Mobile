import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_application/core/constants/shared_preference/shared_preference_keys.dart';

class LocalStorage {
  static late SharedPreferences _sp;

  static Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static SharedPreferences get sharedPreferences => _sp;

  /// deleteToken
  static Future<void> deleteToken() async {
    await _sp.remove(SharedPreferenceKeys.KEY_TOKEN);
  }

  /// deleteFcmToken
  static Future<void> deleteFcmToken() async {
    await _sp.remove(SharedPreferenceKeys.KEY_FIREBASE_TOKEN);
  }

  /// deleteFcmToken
  static Future<void> deleteOldFcmToken() async {
    await _sp.remove(SharedPreferenceKeys.KEY_OLD_FIREBASE_TOKEN);
  }

  /// persistToken
  static Future<void> persistToken(String token) async {
    await _sp.setString(SharedPreferenceKeys.KEY_TOKEN, token);
  }

  /// persist OldFcmToken
  static Future<void> persistOldFcmToken(String token) async {
    await _sp.setString(SharedPreferenceKeys.KEY_OLD_FIREBASE_TOKEN, token);
  }

  /// persistFcmToken
  static Future<void> persistFcmToken(String token) async {
    await _sp.setString(SharedPreferenceKeys.KEY_FIREBASE_TOKEN, token);
  }

  /// read authToken
  /// if returns null thats means there no SP instance
  static String? get authToken {
    return _sp.getString(SharedPreferenceKeys.KEY_TOKEN);
  }

  /// read fcmToken
  /// if returns null thats means there no SP instance
  static String? get fcmToken {
    return _sp.getString(SharedPreferenceKeys.KEY_FIREBASE_TOKEN);
  }

  /// check if hasToken or not
  static bool get hasToken {
    String? token = _sp.getString(SharedPreferenceKeys.KEY_TOKEN);
    if (token != null) return true;
    return false;
  }

  /// check if hasFcmToken or not
  static bool get hasFcmToken {
    String? token = _sp.getString(SharedPreferenceKeys.KEY_FIREBASE_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }

  /// Persist Theme Mode
  static Future<void> persistThemeMode(ThemeMode theme) async {
    await _sp.setInt(SharedPreferenceKeys.KEY_APP_THEME, theme.index);
  }

  /// Get APP Theme Mode
  static ThemeMode get getThemeMode {
    int? token = _sp.getInt(SharedPreferenceKeys.KEY_APP_THEME);
    if (token == null) return ThemeMode.light;
    return ThemeMode.values[token];
  }
}
