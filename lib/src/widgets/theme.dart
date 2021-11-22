import 'package:flutter/material.dart';

class MyTheme {
  static String appName = 'aMAze';
  static ThemeData darkTheme() => ThemeData();
  static ThemeData lightTheme() => ThemeData();
}

/// Use this for implemeting custom text with less hastle.
class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.title,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.left,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);
  final String title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
