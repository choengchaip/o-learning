import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      fontFamily: lang == Config.defaultLang ? GoogleFonts
          .sarabun()
          .fontFamily : GoogleFonts
          .quicksand()
          .fontFamily,
      textTheme: TextTheme(
        button: TextStyle(
          color: Color(0xFFFF3D00),
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ).copyWith(
      pageTransitionsTheme:
      PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      }),
    );
  }
}
