import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculator.dart';

void main() {
  // Disable Landscape Mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const CalculatorApp()));
}
