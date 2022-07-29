import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized the text styles that are used widely in app
class TextThemeStyles {
  static final _fontSizeDelta = 25.sp;

  static final headline1 = TextStyle(fontSize: 112.sp + _fontSizeDelta);
  static final headline2 = TextStyle(fontSize: 56.sp + _fontSizeDelta);
  static final headline3 = TextStyle(fontSize: 45.sp + _fontSizeDelta);
  static final headline4 = TextStyle(fontSize: 34.sp + _fontSizeDelta);
  static final headline5 = TextStyle(fontSize: 24.sp + _fontSizeDelta);
  static final headline6 = TextStyle(fontSize: 21.sp + _fontSizeDelta);

  static final subtitle1 = TextStyle(fontSize: 17.sp + _fontSizeDelta);
  static final subtitle2 = TextStyle(fontSize: 15.sp + _fontSizeDelta);

  static final bodyText1 = TextStyle(fontSize: 15.sp + _fontSizeDelta);
  static final bodyText2 = TextStyle(fontSize: 15.sp + _fontSizeDelta);

  static final caption = TextStyle(fontSize: 13.sp + _fontSizeDelta);

  static final button = TextStyle(fontSize: 13.sp + _fontSizeDelta);

  static final overline = TextStyle(fontSize: 11.sp + _fontSizeDelta);
}
