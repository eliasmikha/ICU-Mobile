import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/core/navigation/nav.dart';
import 'package:starter_application/core/theme/themes_data.dart';
import 'package:starter_application/features/account/presentation/screen/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_config.dart';

class Utils {
  Utils._();
  /// Find if any widget has focus in the given [context] and unfocus it
static void unFocus(BuildContext context) {
  if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
}

static void launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

static void changeTheme(BuildContext context) async {
  ThemeSwitcher.of(context).changeTheme(
    theme: AppConfig().themeMode == ThemeMode.light
        ? ThemesData.darkTheme
        : ThemesData.lightTheme,
    isReversed: AppConfig().themeMode == ThemeMode.dark ? true : false,
  );

  ThemeMode theme = AppConfig().themeMode == ThemeMode.light
      ? ThemeMode.dark
      : ThemeMode.light;

  await LocalStorage.persistThemeMode(theme);
  AppConfig().themeMode = theme;
}
//TODO Make it request
static void logout() async {
  if (LocalStorage.hasToken) {
    await LocalStorage.deleteToken();
    await LocalStorage.deleteFcmToken();
    await LocalStorage.deleteOldFcmToken();
    Nav.off(
      LoginScreen.routeName,
      arguments: LoginScreenParam(),
    );
  }
}





}
