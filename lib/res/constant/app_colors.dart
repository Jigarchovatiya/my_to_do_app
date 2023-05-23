import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color(0x1a2B7A63),
  100: const Color(0x262B7A63),
  200: const Color(0x332B7A63),
  300: const Color(0x4d2B7A63),
  400: const Color(0x662B7A63),
  500: const Color(0x802B7A63),
  600: const Color(0x992B7A63),
  700: const Color(0xb32B7A63),
  800: const Color(0xcc2B7A63),
  900: const Color(0xe62B7A63),
};

class AppColors {
  static MaterialColor materialColor = MaterialColor(0XFF2B7A63, color);
  static const Color materialAppColor = Color(0XFF2B7A63);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
  static const Color deActiveIcon = Color(0xFFD0D0D0);
  static const Color selectTextColor = Color(0xFF6B6B6B);
  static const Color fillColor = Color(0xFFCDCDCD);
  static const Color deselectTextColor = Color(0xFF808080);
  static const Color transparent = Colors.transparent;
}
