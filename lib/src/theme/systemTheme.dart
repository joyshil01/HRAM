// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../theme/textTheme.dart';
import 'buttonTheme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // primarySwatch: const MaterialColor(0xFFFFE200, <int, Color>{
    //   50: Color(0x1AFFE200),
    //   100: Color(0x33FFE200),
    //   200: Color(0x4DFFE200),
    //   300: Color(0x66FFE200),
    //   400: Color(0x80FFE200),
    //   500: Color(0xFFFFE200),
    //   600: Color(0x99FFE200),
    //   700: Color(0xB3FFE200),
    //   800: Color(0xCCFFE200),
    //   900: Color(0xE6FFE200),
    // }),
    textTheme: TTextTheme.lightTheme,
    outlinedButtonTheme: sButtonTheme.sLightOutlineButtonTheme,
    elevatedButtonTheme: sButtonTheme.sLightElevationButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTheme,
    outlinedButtonTheme: sButtonTheme.sDarkOutlineButtonTheme,
    elevatedButtonTheme: sButtonTheme.sDarkElevationButtonTheme,
  );
}
