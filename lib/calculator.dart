import 'package:flutter/material.dart' hide Colors;
import 'package:modern_calculator/widgets/calculator_display.dart';
import 'package:modern_calculator/widgets/calculator_tab.dart';
import 'package:modern_calculator/widgets/calculator_second_display.dart';
import '../src/styles.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CalculatorSecondDisplay(),
            CalculatorDisplay(),
            CalculatorTab(),
          ],
        ),
        backgroundColor: UIColors.neutral[500],
      ),
    );
  }
}