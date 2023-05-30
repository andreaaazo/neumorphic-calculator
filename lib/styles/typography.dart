import 'package:flutter/material.dart' hide Colors;
import 'package:modern_calculator/styles/colors.dart';

class Paragraph extends Text {
  final String text;
  final Color? color;
  final double? size;

  Paragraph({
    required this.text,
    this.color,
    this.size,
    super.key,
  }) : super(text,
            style: TextStyle(
              fontFamily: "Rubik",
              fontSize: size ?? 24,
              color: color ?? Colors.textAndIconLight[100],
            ));
}
