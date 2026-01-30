import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  const CustomText({super.key, required this.text, required this.fontSize, this.color = Colors.black, this.textAlign = TextAlign.start, this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      textAlign: textAlign,
    );
  }
}
