import 'dart:ui';

Color colorConvert(String color) {
  color = color.replaceAll("#", "");

  if (color.length == 8) {
    return Color(int.parse("0x" + color));
  } else
    return Color(int.parse("0xFF" + color));
}
