import 'package:flutter/services.dart';

class UIColors {
  static final Map primary = {
    100: const Color.fromRGBO(231, 214, 247, 1),
    200: const Color.fromRGBO(207, 175, 240, 1),
    300: const Color.fromRGBO(163, 125, 210, 1),
    400: const Color.fromRGBO(116, 82, 166, 1),
    500: const Color.fromRGBO(62, 35, 107, 1), // primary
    600: const Color.fromRGBO(47, 25, 92, 1), // hover
    700: const Color.fromRGBO(35, 17, 77, 1), // active-pressed
    800: const Color.fromRGBO(24, 11, 62, 1),
    900: const Color.fromRGBO(16, 6, 51, 1),
  };
  static final Map neutral = {
    100: const Color.fromRGBO(237, 233, 245, 1),
    200: const Color.fromRGBO(219, 212, 235, 1),
    300: const Color.fromRGBO(175, 167, 195, 1),
    400: const Color.fromRGBO(117, 111, 135, 1),
    500: const Color.fromRGBO(45, 42, 55, 1), // primary
    600: const Color.fromRGBO(34, 30, 47, 1),
    700: const Color.fromRGBO(24, 21, 39, 1),
    800: const Color.fromRGBO(16, 13, 31, 1),
    900: const Color.fromRGBO(10, 8, 26, 1),
  };
  static final Map textAndIconLight = {
    100: const Color.fromRGBO(235, 235, 235, 1), // primary
    200: const Color.fromRGBO(235, 235, 235, 0.75), // secondary
    300: const Color.fromRGBO(235, 235, 235, 0.6), // disabled
  };
  static final Map textAndIconDark = {
    100: const Color.fromRGBO(51, 38, 74, 1), // primary
    200: const Color.fromRGBO(51, 38, 74, 0.8), // secondary
    300: const Color.fromRGBO(51, 38, 74, 0.65), // disabled
  };
}
