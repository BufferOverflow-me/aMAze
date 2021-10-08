import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData darkBlueTheme() => ThemeData(
        primarySwatch: themeOneSwatch,
        primaryColor: themeOneBg,
        primaryColorLight: themeOneFg,
        fontFamily: GoogleFonts.poppins().fontFamily,
        backgroundColor: themeOneBg,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(color: themeOneFg, fontSize: 64),
          headline2: GoogleFonts.poppins(
            color: themeOneFg,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
          headline3: GoogleFonts.poppins(color: themeOneFg, fontSize: 36),
          headline4: GoogleFonts.poppins(
              color: themeOneFg, fontSize: 24, fontWeight: FontWeight.w700),
          headline5: GoogleFonts.poppins(
            color: themeOneFg,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          headline6: GoogleFonts.poppins(
              color: themeOneFg, fontSize: 14, fontWeight: FontWeight.w600),
          bodyText1: GoogleFonts.poppins(color: themeOneFg, fontSize: 12),
          bodyText2: GoogleFonts.poppins(color: themeOneFg),
          button: GoogleFonts.poppins(color: themeOneFg),
          caption: GoogleFonts.poppins(color: themeOneFg),
          overline: GoogleFonts.poppins(color: themeOneFg),
          subtitle1: GoogleFonts.poppins(color: themeOneFg),
          subtitle2: GoogleFonts.poppins(color: themeOneFg),
        ),
        scaffoldBackgroundColor: themeOneBg,
        cardColor: themeOneFg,
        brightness: Brightness.dark,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: themeOneFg,
            textStyle: GoogleFonts.poppins(color: themeOneFg),
          ),
        ),
        splashColor: themeOneFg,
        appBarTheme: AppBarTheme(
          color: themeOneBg,
          elevation: 0.0,
          iconTheme: IconThemeData(color: themeOneFg),
        ),
      );
  static ThemeData purpleLightTheme(BuildContext context) => ThemeData(
        primarySwatch: themeTwoSwatch,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: themeThreeSwatch,
        primaryColor: themeThreeBg,
        primaryColorLight: themeThreeFg,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: themeThreeFg,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(color: themeThreeFg),
          headline2: GoogleFonts.poppins(color: themeThreeFg),
          headline3: GoogleFonts.poppins(color: themeThreeFg),
          headline4: GoogleFonts.poppins(color: themeThreeFg),
          headline5: GoogleFonts.poppins(color: themeThreeFg),
          headline6: GoogleFonts.poppins(color: themeThreeFg),
          bodyText1: GoogleFonts.poppins(color: themeThreeFg),
          bodyText2: GoogleFonts.poppins(color: themeThreeFg),
          button: GoogleFonts.poppins(color: themeThreeFg),
          caption: GoogleFonts.poppins(color: themeThreeFg),
          overline: GoogleFonts.poppins(color: themeThreeFg),
          subtitle1: GoogleFonts.poppins(color: themeThreeFg),
          subtitle2: GoogleFonts.poppins(color: themeThreeFg),
        ),
        scaffoldBackgroundColor: themeThreeBg,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: themeThreeBg,
          elevation: 0.0,
          iconTheme: IconThemeData(color: themeThreeFg),
        ),
      );
  static ThemeData greenLightTheme(BuildContext context) => ThemeData(
        primarySwatch: themeFourSwatch,
        primaryColor: themeFourBg,
        primaryColorLight: themeFourFg,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: themeFourBg,
        iconTheme: IconThemeData(color: themeFourBg),
        scaffoldBackgroundColor: themeFourBg,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(color: themeFourFg, fontSize: 64),
          headline2: GoogleFonts.poppins(
            color: themeFourFg,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
          headline3: GoogleFonts.poppins(color: themeFourFg, fontSize: 36),
          headline4: GoogleFonts.poppins(
              color: themeFourFg, fontSize: 24, fontWeight: FontWeight.w700),
          headline5: GoogleFonts.poppins(
            color: themeFourFg,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          headline6: GoogleFonts.poppins(
              color: themeOneFg, fontSize: 14, fontWeight: FontWeight.w600),
          bodyText1: GoogleFonts.poppins(color: themeFourFg, fontSize: 12),
          bodyText2: GoogleFonts.poppins(color: themeFourFg),
          button: GoogleFonts.poppins(color: themeFourFg),
          caption: GoogleFonts.poppins(color: themeFourFg),
          overline: GoogleFonts.poppins(color: themeFourFg),
          subtitle1: GoogleFonts.poppins(color: themeFourFg),
          subtitle2: GoogleFonts.poppins(color: themeFourFg),
        ),
        appBarTheme: AppBarTheme(
          color: themeFourFg,
          elevation: 0.0,
          iconTheme: IconThemeData(color: themeFourFg),
        ),
      );

  // Colors

  // Theme 1
  static Color themeOneBg = const Color(0xFF22223B);
  static Color themeOneFg = const Color(0xFFF2E9E4);
  // Primary Swatch
  static const MaterialColor themeOneSwatch = MaterialColor(
    _themeOnePrimaryValue,
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
      900: Color(_themeOnePrimaryValue),
    },
  );
  static const int _themeOnePrimaryValue = 0xFF22223B;

  // Theme 2
  static Color themeTwoBg = const Color(0xFF6154C4);
  static Color themeTwoFg = const Color(0xFFDDF2C6);
  // Primary Swatch
  static const MaterialColor themeTwoSwatch = MaterialColor(
    _themeOnePrimaryValue,
    <int, Color>{
      50: Color(0xFFEDE7F6),
      100: Color(0xFFD1C4E9),
      200: Color(0xFFB39DDB),
      300: Color(0xFF9575CD),
      400: Color(0xFF7E57C2),
      500: Color(_themetwoPrimaryValue),
      600: Color(0xFF673AB7),
      700: Color(0xFF5E35B1),
      800: Color(0xFF512DA8),
      900: Color(0xFF4527A0),
    },
  );
  static const int _themetwoPrimaryValue = 0xFF6154C4;

  // Theme 3
  static Color themeThreeBg = const Color(0xFF263238);
  static Color themeThreeFg = const Color(0xFFFFFFFF);
  // Primary Swatch
  static const MaterialColor themeThreeSwatch = MaterialColor(
    _themeOnePrimaryValue,
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
      900: Color(_themeThreePrimaryValue),
    },
  );
  static const int _themeThreePrimaryValue = 0xFF263238;

  // Theme 4
  static Color themeFourBg = const Color(0xFF1EA242);
  static Color themeFourBg1 = const Color(0xFFE5F8E1);
  static Color themeFourFg = const Color(0xFFFFFFFF);
  static Color themeFourFg1 = const Color(0xFF1EA242);
  // Primary Swatch
  static const MaterialColor themeFourSwatch = MaterialColor(
    _themeOnePrimaryValue,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(_themeFourPrimaryValue),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(0xFF4CAF50),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );
  static const int _themeFourPrimaryValue = 0xFFE5F8E1;
}
