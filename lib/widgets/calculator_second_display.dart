import 'package:flutter/material.dart';
import 'package:modern_calculator/widgets/calculator_processor.dart';
import '../src/ui.dart';

/// A widget that displays the second calculator display showing additional information or history.
class CalculatorSecondDisplay extends StatefulWidget {
  const CalculatorSecondDisplay({Key? key}) : super(key: key);

  @override
  CalculatorSecondDisplayState createState() => CalculatorSecondDisplayState();
}

class CalculatorSecondDisplayState extends State<CalculatorSecondDisplay> {
  String text = '';

  @override
  void initState() {
    super.initState();
    _subscribeToDisplayStream();
  }

  @override
  void dispose() {
    _unsubscribeFromDisplayStream();
    super.dispose();
  }

  /// Subscribes to the display stream to receive updates and update the [text] accordingly.
  void _subscribeToDisplayStream() {
    CalculatorProcessor.secondDisplayStream.listen((event) {
      setState(() {
        text = event;
      });
    });
  }

  /// Unsubscribes from the display stream.
  void _unsubscribeFromDisplayStream() {
    CalculatorProcessor.secondDisplayStream.drain();
  }

  @override
  Widget build(BuildContext context) {
    return UIContainer(
      width: double.infinity,
      color: UIColors.neutral[500],
      margin: const EdgeInsets.fromLTRB(54, 0, 54, 24),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      alignment: Alignment.centerRight,
      shape: "outsideRounded",
      child: _buildParagraph(
        text,
        size: 16,
        color: UIColors.textAndIconLight[200],
        textAlign: TextAlign.right,
      ),
    );
  }

  /// Builds a [Paragraph] widget with the given [text], [size], [color], and [textAlign].
  Widget _buildParagraph(
    String text, {
    required double size,
    required Color color,
    required TextAlign textAlign,
  }) {
    return Paragraph(
      text: text,
      size: size,
      color: color,
      maxLines: 1,
      textAlign: textAlign,
      overflow: TextOverflow.clip,
    );
  }
}
