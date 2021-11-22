import 'package:flutter/material.dart';

class MyColor {
  static Color primaryFg = const Color(0xFFF6FDFA);
  static Color primaryBg = const Color(0xFF212121);
  static const MaterialColor primarySwatch = MaterialColor(
    _primaryThemeValue,
    <int, Color>{
      900: Color(_primaryThemeValue),
    },
  );

  static const int _primaryThemeValue = 0xFF22223B;
}
