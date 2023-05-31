import 'package:flutter/material.dart';
import 'calculator_processor.dart';
import '../src/components.dart';

class CalculatorTab extends StatelessWidget {
  const CalculatorTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      padding: const EdgeInsets.all(32),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      children: _buildButtons(),
    );
  }

  /// Builds the list of UI buttons for the calculator tab.
  List<Widget> _buildButtons() {
    return [
      _buildButton("CE", "primary", "CE"),
      _buildButton("C", "secondary", "C"),
      _buildButton("%", "secondary", "%"),
      _buildButton("/", "primary", "/"),
      _buildButton("7", "secondary", "7"),
      _buildButton("8", "secondary", "8"),
      _buildButton("9", "secondary", "9"),
      _buildButton("X", "primary", "X"),
      _buildButton("4", "secondary", "4"),
      _buildButton("5", "secondary", "5"),
      _buildButton("6", "secondary", "6"),
      _buildButton("-", "primary", "-"),
      _buildButton("1", "secondary", "1"),
      _buildButton("2", "secondary", "2"),
      _buildButton("3", "secondary", "3"),
      _buildButton("+", "primary", "+"),
      _buildEmptyButton(),
      _buildButton("0", "secondary", "0"),
      _buildButton(".", "secondary", "."),
      _buildButton("=", "primary", null, CalculatorProcessor.startProcessor),
    ];
  }

  /// Builds a UI button with the given [text], [type], [value], and [onTap] callback.
  Widget _buildButton(String text, String type, String? value,
      [VoidCallback? onTap]) {
    return UITextButton(
      text: text,
      type: type,
      onTap: () {
        if (value == null && onTap != null) {
          onTap();
        } else if (value != null) {
          CalculatorProcessor.sendToProcessor(value);
        }
      },
    );
  }

  /// Builds an empty UI button.
  Widget _buildEmptyButton() {
    return const UITextButton(text: " ", type: "secondary");
  }
}
