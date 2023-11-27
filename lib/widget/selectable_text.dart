import 'package:flutter/material.dart';

class AutoWidthTextContainer extends StatelessWidget {
  final String text;
  final double borderWidth;
  final Color borderColor;
  final double borderRadius;
  final VoidCallback onPressed;


  const AutoWidthTextContainer({
    Key? key,
    required this.text,
    this.borderWidth = 2.0,
    this.borderColor = Colors.black,
    this.borderRadius = 8.0,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: 16.0),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);


    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          //color: Colors.black,
          border: Border.all(
            width: borderWidth,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.all(8.0),
        child: SelectableText(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
