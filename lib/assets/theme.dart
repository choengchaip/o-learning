import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_learning/assets/styles.dart';

class AppThemeData {
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    errorColor: errorColor,
    dividerColor: dividerColor,
    cursorColor: Colors.black,
    fontFamily: GoogleFonts.sarabun().fontFamily,
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
