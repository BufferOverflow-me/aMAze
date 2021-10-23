import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static String appName = "aMAze";
  static ThemeData darkBlueTheme() => ThemeData(
        primarySwatch: darkBlueThemeSwatch,
        primaryColor: darkBlueThemeBg,
        primaryColorLight: darkBlueThemeFg,
        fontFamily: GoogleFonts.poppins().fontFamily,
        backgroundColor: darkBlueThemeBg,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(color: darkBlueThemeFg, fontSize: 64),
          headline2: GoogleFonts.poppins(
            color: darkBlueThemeFg,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
          headline3: GoogleFonts.poppins(color: darkBlueThemeFg, fontSize: 36),
          headline4: GoogleFonts.poppins(
              color: darkBlueThemeFg,
              fontSize: 24,
              fontWeight: FontWeight.w700),
          headline5: GoogleFonts.poppins(
            color: darkBlueThemeFg,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          headline6: GoogleFonts.poppins(
              color: darkBlueThemeFg,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          bodyText1: GoogleFonts.poppins(color: darkBlueThemeFg, fontSize: 12),
          bodyText2: GoogleFonts.poppins(color: darkBlueThemeFg),
          button: GoogleFonts.poppins(color: darkBlueThemeFg),
          caption: GoogleFonts.poppins(color: darkBlueThemeFg),
          overline: GoogleFonts.poppins(color: darkBlueThemeFg),
          subtitle1: GoogleFonts.poppins(color: darkBlueThemeFg),
          subtitle2: GoogleFonts.poppins(color: darkBlueThemeFg),
        ),
        scaffoldBackgroundColor: darkBlueThemeBg,
        cardColor: darkBlueThemeFg,
        brightness: Brightness.dark,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: darkBlueThemeFg,
            textStyle: GoogleFonts.poppins(color: darkBlueThemeFg),
          ),
        ),
        splashColor: darkBlueThemeFg,
        appBarTheme: AppBarTheme(
          color: darkBlueThemeBg,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkBlueThemeFg),
        ),
      );

  static ThemeData greenLightTheme() => ThemeData(
        primarySwatch: greenThemeSwatch,
        primaryColor: greenThemeBg,
        primaryColorLight: greenThemeFg,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: greenThemeBg,
        iconTheme: IconThemeData(color: greenThemeBg),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: greenThemeFg,
          elevation: 0.0,
          iconTheme: IconThemeData(color: greenThemeFg),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: greenThemeFg,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(color: greenThemeFg, fontSize: 64),
          headline2: GoogleFonts.poppins(
            color: greenThemeFg,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
          headline3: GoogleFonts.poppins(color: greenThemeFg, fontSize: 36),
          headline4: GoogleFonts.poppins(
              color: greenThemeFg, fontSize: 24, fontWeight: FontWeight.w700),
          headline5: GoogleFonts.poppins(
            color: greenThemeFg,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          headline6: GoogleFonts.poppins(
              color: darkBlueThemeFg,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          bodyText1: GoogleFonts.poppins(color: greenThemeFg, fontSize: 12),
          bodyText2: GoogleFonts.poppins(color: greenThemeFg),
          button: GoogleFonts.poppins(color: greenThemeFg),
          caption: GoogleFonts.poppins(color: greenThemeFg),
          overline: GoogleFonts.poppins(color: greenThemeFg),
          subtitle1: GoogleFonts.poppins(color: greenThemeFg),
          subtitle2: GoogleFonts.poppins(color: greenThemeFg),
        ),
      );

  // Colors

  // Theme 1
  static Color darkBlueThemeBg = const Color(0xFF22223B);
  static Color darkBlueThemeFg = const Color(0xFFF2E9E4);
  // Primary Swatch
  static const MaterialColor darkBlueThemeSwatch = MaterialColor(
    _darkBlueThemePrimaryValue,
    <int, Color>{
      50: Color(0xFFECEFF1),
      100: Color(0xFFCFD8DC),
      200: Color(0xFFB0BEC5),
      300: Color(0xFF90A4AE),
      400: Color(0xFF78909C),
      500: Color(0xFF607D8B),
      600: Color(0xFF546E7A),
      700: Color(0xFF455A64),
      800: Color(0xFF37474F),
      900: Color(_darkBlueThemePrimaryValue),
    },
  );
  static const int _darkBlueThemePrimaryValue = 0xFF22223B;

  // // Theme 2
  // static Color themeTwoBg = const Color(0xFF6154C4);
  // static Color themeTwoFg = const Color(0xFFDDF2C6);
  // // Primary Swatch
  // static const MaterialColor themeTwoSwatch = MaterialColor(
  //   _darkBlueThemePrimaryValue,
  //   <int, Color>{
  //     50: Color(0xFFEDE7F6),
  //     100: Color(0xFFD1C4E9),
  //     200: Color(0xFFB39DDB),
  //     300: Color(0xFF9575CD),
  //     400: Color(0xFF7E57C2),
  //     500: Color(_themetwoPrimaryValue),
  //     600: Color(0xFF673AB7),
  //     700: Color(0xFF5E35B1),
  //     800: Color(0xFF512DA8),
  //     900: Color(0xFF4527A0),
  //   },
  // );
  // static const int _themetwoPrimaryValue = 0xFF6154C4;

  // // Theme 3
  // static Color themeThreeBg = const Color(0xFF263238);
  // static Color themeThreeFg = const Color(0xFFFFFFFF);
  // // Primary Swatch
  // static const MaterialColor themeThreeSwatch = MaterialColor(
  //   _darkBlueThemePrimaryValue,
  //   <int, Color>{
  //     50: Color(0xFFECEFF1),
  //     100: Color(0xFFCFD8DC),
  //     200: Color(0xFFB0BEC5),
  //     300: Color(0xFF90A4AE),
  //     400: Color(0xFF78909C),
  //     500: Color(0xFF607D8B),
  //     600: Color(0xFF546E7A),
  //     700: Color(0xFF455A64),
  //     800: Color(0xFF37474F),
  //     900: Color(_themeThreePrimaryValue),
  //   },
  // );
  // static const int _themeThreePrimaryValue = 0xFF263238;

  // Light green theme
  static Color greenThemeBg = const Color(0xFF1EA242);
  static Color greenThemeBg1 = const Color(0xFFE5F8E1);
  static Color greenThemeFg1 = const Color(0xFFFFFFFF);
  static Color greenThemeFg = const Color(0xFF1EA242);
  // Primary Swatch
  static const MaterialColor greenThemeSwatch = MaterialColor(
    _darkBlueThemePrimaryValue,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(_greenThemePrimaryValue),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(0xFF4CAF50),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );
  static const int _greenThemePrimaryValue = 0xFFE5F8E1;
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
