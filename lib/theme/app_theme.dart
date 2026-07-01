import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Inter',
    colorSchemeSeed: Colors.indigoAccent,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Inter',
    colorSchemeSeed: Colors.indigoAccent,
  );
}
