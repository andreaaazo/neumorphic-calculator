import 'dart:async';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

/// This abstract class represents a calculator processor.
/// It provides functionality for updating displays, sending input to the processor,
/// resetting the processor, filtering expressions, and starting the processor.
abstract class CalculatorProcessor {
  static final displayStreamController = StreamController<String>();
  static final displayStream = displayStreamController.stream;
  static final secondDisplayStreamController = StreamController<String>();
  static final secondDisplayStream = secondDisplayStreamController.stream;
  static String rawExpression = "";
  static String result = "";
  static String lastExpression = "";

  /// Updates the main display with the given [text].
  static void updateDisplay(String text) {
    displayStreamController.add(text);
  }

  /// Updates the second display with the given [text].
  static void updateSecondDisplay(String text) {
    secondDisplayStreamController.add(text);
  }

  /// Sends the given [text] to the processor for processing.
  static void sendToProcessor(String text) {
    switch (text) {
      case "CE":
        resetProcessor();
        break;
      case "C":
        if (rawExpression.length >= 2) {
          rawExpression = rawExpression.substring(0, rawExpression.length - 1);
          updateDisplay(rawExpression);
        } else {
          resetProcessor();
        }
        break;
      default:
        if (rawExpression.length <= 10) {
          rawExpression += text;
        }
        updateDisplay(rawExpression);
        updateSecondDisplay(lastExpression);
        break;
    }
  }

  /// Resets the processor and clears all expressions and displays.
  static void resetProcessor() {
    rawExpression = "";
    result = "";
    lastExpression = "";
    updateDisplay("0");
    updateSecondDisplay("");
  }

  /// Filters the raw expression by replacing "X" with "*" and "/" with "/".
  static String filterExpression(String rawExpression) {
    return rawExpression.replaceAll("X", "*").replaceAll("/", "/").toString();
  }

  /// Starts the processor by evaluating the expression and updating the displays.
  static void startProcessor() {
    String expression = filterExpression(rawExpression);

    try {
      Parser parser = Parser();
      Expression calculator = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      String rawResult =
          calculator.evaluate(EvaluationType.REAL, contextModel).toString();
      result = rawResult.characters.take(10).toString();
      updateDisplay(result);
      updateSecondDisplay(expression);
    } catch (e) {
      updateDisplay("Error");
    }
  }
}
