import 'package:flutter/material.dart';

Map<int, Color> primaryMap = {
  50: Color(0xfff27e77).withOpacity(0.1),
  100: Color(0xfff27e77).withOpacity(0.2),
  200: Color(0xfff27e77).withOpacity(0.3),
  300: Color(0xfff27e77).withOpacity(0.4),
  400: Color(0xfff27e77).withOpacity(0.5),
  500: Color(0xfff27e77).withOpacity(0.6),
  600: Color(0xfff27e77).withOpacity(0.7),
  700: Color(0xfff27e77).withOpacity(0.8),
  800: Color(0xfff27e77).withOpacity(0.9),
  900: Color(0xfff27e77).withOpacity(1),
};

abstract class ColorPalette {
  static const PRIMARY = Color(0xfff27e77);
  static const SECONDARY = Color(0xfff8b7b3);
  static const TERTIARY = Color(0xfffd3f54);
  static const BACKGROUND_PEACH = Color(0xfffdeceb);
  static const PRIMARY_TEXT = Color(0xff050505);
  static const BACKGROUND_GREY = Color(0xffc4c4c4);
  static const BACKGROUND_LIGHT = Color(0xfffff4f3);
  static const TEXTFIELD_HINT_COLOR = Color(0xffada8a8);
  static const PALE_TEXT_COLOR = Color(0xff929090);
  static const DARK_TEXT_COLOR = Color(0xff444242);
  static const OTP_BACKGROUND_COLOR = Color(0xfff3f3f3);
}

abstract class MaterialColorPalette {
  static MaterialColor primaryMaterial = MaterialColor(0xfff27e77, primaryMap);
}
