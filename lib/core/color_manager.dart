import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = Hex16Color.fromHex("#5DC482");
  static Color black = Hex16Color.fromHex("#292D32");
  static Color skyBlue = Hex16Color.fromHex("#ECF3F6");
  static Color secondary = Hex16Color.fromHex("#364960");

}

extension Hex16Color on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
