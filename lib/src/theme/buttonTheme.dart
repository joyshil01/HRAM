// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/sizes.dart';

class sButtonTheme {
  sButtonTheme._();

  static final sLightElevationButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      foregroundColor: sWhiteColor,
      backgroundColor: sSecondaryColor,
      side: const BorderSide(color: sSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: sButtonWeight),
    ),
  );
  static final sDarkElevationButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      foregroundColor: sSecondaryColor,
      backgroundColor: sWhiteColor,
      side: const BorderSide(color: sSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: sButtonWeight),
    ),
  );

  static final sLightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      foregroundColor: sSecondaryColor,
      side: const BorderSide(color: sSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: sButtonWeight),
    ),
  );
  static final sDarkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      foregroundColor: sWhiteColor,
      side: const BorderSide(color: sWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: sButtonWeight),
    ),
  );
}
