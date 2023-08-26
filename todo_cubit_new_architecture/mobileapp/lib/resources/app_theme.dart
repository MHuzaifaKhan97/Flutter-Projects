import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = HexColor("#1e81b0");
  static Color secondaryColor = HexColor("#d6d2d2");
  static Color colorWhite = HexColor('#ffffff');
  static Color colorError = HexColor('#FF3131');
  static Color colorSuccess = HexColor('#476608');
  static Color colorWarning = HexColor('#DC9B0A');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
