import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static String appName = 'aMAze';
  static ThemeData darkTheme() => ThemeData();
  static ThemeData lightTheme() => ThemeData(
        primarySwatch: primarySwatch,
        textTheme: myTextTheme(),
        primaryTextTheme: myTextTheme(),
      );

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF311B92,
    <int, Color>{
      50: Color(0xFFEDE7F6),
      100: Color(0xFFD1C4E9),
      200: Color(0xFFB39DDB),
      300: Color(0xFF9575CD),
      400: Color(0xFF7E57C2),
      500: Color(0xFF673AB7),
      600: Color(0xFF5E35B1),
      700: Color(0xFF512DA8),
      800: Color(0xFF4527A0),
      900: Color(0xFF311B92),
      1000: Color(0xFFB388FF),
    },
  );

  // A function for textTheme
  static TextTheme myTextTheme() {
    List<double> fontSizes = [64, 48, 32, 24, 20, 16, 14];
    return TextTheme(
      headline1: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[0],
          fontWeight: FontWeight.bold,
        ),
      ),
      headline2: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[1],
          fontWeight: FontWeight.bold,
        ),
      ),
      headline3: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[2],
          fontWeight: FontWeight.bold,
        ),
      ),
      headline4: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[3],
          fontWeight: FontWeight.bold,
        ),
      ),
      headline5: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[4],
          fontWeight: FontWeight.bold,
        ),
      ),
      headline6: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[5],
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle1: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[4],
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle2: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[5],
          fontWeight: FontWeight.w400,
        ),
      ),
      bodyText1: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[6],
        ),
      ),
      bodyText2: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[6],
        ),
      ),
      button: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[5],
          fontWeight: FontWeight.bold,
        ),
      ),
      caption: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[6],
        ),
      ),
      overline: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSizes[6],
        ),
      ),
    );
  }
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
