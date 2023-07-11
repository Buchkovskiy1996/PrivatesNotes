import 'package:flutter/material.dart';

class TextStyleTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const TextStyleTitle(
      {required this.text,
      this.fontSize = 36,
      this.fontWeight = FontWeight.bold,
      this.color = const Color(0xff10C5C7),
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
