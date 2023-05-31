import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class UIContainer extends Container {
  UIContainer(
      {super.key,
      super.child,
      super.width,
      super.alignment,
      Color? color,
      String? shape,
      super.padding,
      super.margin})
      : super(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: color,
              boxShadow: getType(shape)),
        );

  static List<BoxShadow> getType(String? shape) {
    List<BoxShadow> outsideRoundedShape = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.9),
        spreadRadius: 0,
        blurRadius: 3,
        offset: Offset(1, 1),
      ),
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.3),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(-1, -1),
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(1, -1),
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        blurRadius: 2,
        spreadRadius: 0,
        offset: Offset(-1, 1),
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        blurRadius: 2,
        spreadRadius: 0,
        offset: Offset(-1, -1),
        inset: true,
      ),
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.3),
        blurRadius: 2,
        spreadRadius: 0,
        offset: Offset(1, 1),
        inset: true,
      )
    ];

    List<BoxShadow> insideShape = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.9),
        blurRadius: 3,
        spreadRadius: 0,
        offset: Offset(1, 1),
        inset: true,
      ),
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.9),
        blurRadius: 2,
        spreadRadius: 0,
        offset: Offset(-1, -1),
        inset: true,
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        blurRadius: 2,
        spreadRadius: 0,
        offset: Offset(1, -1),
        inset: true,
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        blurRadius: 2,
        spreadRadius: 0,
        offset: Offset(-1, 1),
        inset: true,
      ),
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        blurRadius: 2,
        spreadRadius: 0,
        offset: Offset(-1, -1),
      ),
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.3),
        blurRadius: 2,
        spreadRadius: 0,
        offset: Offset(1, 1),
      )
    ];

    switch (shape) {
      case "outsideRounded":
        return outsideRoundedShape;
      case "inside":
        return insideShape;
      default:
        return outsideRoundedShape;
    }
  }
}
