import 'package:flutter/material.dart';
import 'colors.dart';

class Paragraph extends Text {
  final String text;
  final Color? color;
  final double? size;

  Paragraph({
    required this.text,
    this.color,
    this.size,
    super.maxLines,
    super.key,
    super.overflow,
    super.textAlign,
  }) : super(
          text,
          style: TextStyle(
            fontFamily: "Rubik",
            fontSize: size ?? 24,
            color: color ?? UIColors.textAndIconLight[100],
          ),
        );
}
