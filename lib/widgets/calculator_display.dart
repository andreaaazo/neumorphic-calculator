import 'package:flutter/material.dart';
import 'calculator_processor.dart';
import '../src/ui.dart';

/// The calculator display widget that shows the current result or expression.
class CalculatorDisplay extends StatefulWidget {
  const CalculatorDisplay({super.key});

  @override
  CalculatorDisplayState createState() => CalculatorDisplayState();
}

class CalculatorDisplayState extends State<CalculatorDisplay> {
  String display = "0";

  @override
  void initState() {
    CalculatorProcessor.displayStream.listen((event) {
      setState(() {
        display = event.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UIContainer(
      shape: "outsideRounded",
      width: double.infinity,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.fromLTRB(24, 12, 34, 12),
      margin: const EdgeInsets.symmetric(horizontal: 34),
      color: UIColors.neutral[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildParagraph(
              "=", 20, UIColors.textAndIconDark[200], TextAlign.left),
          Expanded(
            child: _buildParagraph(
                display, 36, UIColors.textAndIconDark[100], TextAlign.right),
          ),
        ],
      ),
    );
  }

  /// Builds a [Paragraph] widget with the given [text], [size], [color], and [textAlign].
  ///
  /// The [text] parameter specifies the content of the paragraph.
  /// The [size] parameter specifies the font size of the text.
  /// The [color] parameter specifies the color of the text.
  /// The [textAlign] parameter specifies the alignment of the text within the paragraph.
  Widget _buildParagraph(
      String text, double size, Color color, TextAlign textAlign) {
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
