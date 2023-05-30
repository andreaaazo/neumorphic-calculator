import 'dart:async';

import 'package:flutter/material.dart'
    hide BoxDecoration, BoxShadow, TextButton, Colors;
import 'package:flutter/services.dart';
import 'package:modern_calculator/styles/typography.dart';
import 'widgets/text_button.dart';
import './styles/colors.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  // Disable Landscape Mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const CalculatorApp()));
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 54),
                child: const CalcDisplay(),
              ),
              const Center(
                child: CalcTab(),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.neutral[500],
      ),
    );
  }
}

class CalcTab extends StatelessWidget {
  const CalcTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Grid Settings
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      padding: const EdgeInsets.all(32),
      crossAxisSpacing: 12, // X Spacing
      mainAxisSpacing: 12, // Y Spacing
      shrinkWrap: true,

      children: <Widget>[
        TextButton(
          text: "CE",
          type: "primary",
          onTap: () {
            CalculatorStreamer.push("CE");
          },
        ),
        TextButton(
          text: "C",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("C"),
        ),
        TextButton(
          text: "%",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("%"),
        ),
        TextButton(
          text: "/",
          type: "primary",
          onTap: () => CalculatorStreamer.push("/"),
        ),
        TextButton(
          text: "7",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("7"),
        ),
        TextButton(
          text: "8",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("8"),
        ),
        TextButton(
          text: "9",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("9"),
        ),
        TextButton(
          text: "X",
          type: "primary",
          onTap: () => CalculatorStreamer.push("X"),
        ),
        TextButton(
          text: "4",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("4"),
        ),
        TextButton(
          text: "5",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("5"),
        ),
        TextButton(
          text: "6",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("6"),
        ),
        TextButton(
          text: "-",
          type: "primary",
          onTap: () => CalculatorStreamer.push("-"),
        ),
        TextButton(
          text: "1",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("1"),
        ),
        TextButton(
          text: "2",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("2"),
        ),
        TextButton(
          text: "3",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("3"),
        ),
        TextButton(
          text: "+",
          type: "primary",
          onTap: () => CalculatorStreamer.push("+"),
        ),
        const TextButton(text: " ", type: "secondary"),
        TextButton(
          text: "0",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("0"),
        ),
        TextButton(
          text: ".",
          type: "secondary",
          onTap: () => CalculatorStreamer.push("."),
        ),
        TextButton(
          text: "=",
          type: "primary",
          onTap: () => CalculatorStreamer.push("="),
        ),
      ],
    );
  }
}

abstract class CalculatorStreamer {
  static final calculatorStreamController = StreamController();
  static final calculatorStream = calculatorStreamController.stream;

  static void push(String text) {
    calculatorStreamController.add(text);
  }
}

class CalcDisplay extends StatefulWidget {
  const CalcDisplay({super.key});

  @override
  CalcDisplayState createState() => CalcDisplayState();
}

class CalcDisplayState extends State<CalcDisplay> {
  String numbers = "0";
  num result = 0;

  @override
  void initState() {
    CalculatorStreamer.calculatorStream.listen((event) {
      setState(() {
        if (event == "=") {
          try {
            Parser p = Parser();
            Expression exp = p.parse(numbers);
            numbers = (exp.simplify()).toString();
            result = numbers.interpret();
          } catch (e) {
            numbers = "0";
            result = 0;
          }
        } else if (event == "CE") {
          numbers = "0";
          result = 0;
        } else {
          numbers += (event);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Paragraph(
      text: numbers.toString(),
      size: 36,
    );
  }
}
