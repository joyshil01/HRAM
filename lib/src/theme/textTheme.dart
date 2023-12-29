// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TTextTheme {
  static TextTheme lightTheme = const TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Lora',
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'Lora',
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      fontFamily: 'Lora',
    ),
  );
  static TextTheme darkTheme = const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: 'Lora',
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'Lora',
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      fontFamily: 'Lora',
    ),
  );
}
