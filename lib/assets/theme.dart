// @dart=2.9

import 'package:flutter/material.dart';
import 'package:o_learning/assets/styles.dart';
import 'package:o_learning/cores/config.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme({String lang}) {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      errorColor: errorColor,
      dividerColor: dividerColor,
      cursorColor: Colors.black,
      disabledColor: grayLight,
      fontFamily: lang == Config.defaultLang ? 'ThaiFont' : 'EngFont',
      textTheme: TextTheme(
        button: TextStyle(
          color: Color(0xFFFF3D00),
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    ).copyWith(
      pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: ZoomPageTransitionsBuilder(),
            TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
          }),
    );
  }
}
