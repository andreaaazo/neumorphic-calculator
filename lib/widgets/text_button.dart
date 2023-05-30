import 'dart:async';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow, Colors;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../styles/typography.dart';
import 'package:modern_calculator/styles/colors.dart';

class TextButton extends StatefulWidget {
  final String text;
  final String? type;
  final Function()? onTap;

  const TextButton(
      {required this.type, required this.text, this.onTap, super.key});

  @override
  TextButtonState createState() => TextButtonState();
}

class TextButtonState extends State<TextButton> {
  bool isPressed = false;
  Color? typeColor;

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "primary":
        typeColor = isPressed ? Colors.primary[600] : Colors.primary[500];
        break;
      case "secondary":
        typeColor = isPressed ? Colors.neutral[600] : Colors.neutral[500];
        break;
      default:
        typeColor = isPressed ? Colors.primary[600] : Colors.primary[500];
        break;
    }

    Widget container = AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: typeColor,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.29),
            spreadRadius: 0,
            blurRadius: isPressed ? 5 : 2,
          ),
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.26),
            spreadRadius: 0,
            blurRadius: isPressed ? 7 : 4,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 0,
            blurRadius: isPressed ? 9 : 6,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.04),
            blurRadius: isPressed ? 10 : 7,
            spreadRadius: 0,
            offset: const Offset(0, 7),
          ),
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.01),
            blurRadius: isPressed ? 10 : 7,
            spreadRadius: 0,
            offset: const Offset(0, 11),
          )
        ],
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 0.07),
              Color.fromRGBO(255, 255, 255, 0.07),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(255, 255, 255, 0.3),
              spreadRadius: 0,
              blurRadius: isPressed ? 10 : 3,
              offset: const Offset(0, 2),
              inset: true,
            )
          ],
        ),
        child: Paragraph(
          text: widget.text,
          color: isPressed
              ? Colors.textAndIconLight[200]
              : Colors.textAndIconLight[100],
        ),
      ),
    );

    void onTapAction() {
      setState(() {
        isPressed = true;
        widget.onTap?.call();
        Timer(const Duration(milliseconds: 200), () {
          setState(() {
            isPressed = false;
          });
        });
      });
    }

    return GestureDetector(
      onTap: onTapAction,
      child: container,
    );
  }
}
