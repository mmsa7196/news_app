import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'base_theme.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get secondaryColor => const Color(0xff171717);

  @override
  Color get primaryColor =>   Colors.white;

  @override
  Color get iconColor => const Color(0xff808080);
  @override


  @override
  ThemeData get themeData => ThemeData(
    focusColor: primaryColor,
    primaryColor: primaryColor,
    unselectedWidgetColor: secondaryColor,
    hintColor: secondaryColor,
    scaffoldBackgroundColor: secondaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: secondaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: primaryColor, width: 2)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: secondaryColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 16,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 24,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      labelMedium:GoogleFonts.inter(
        fontSize: 16,
        color: secondaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 26,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 25,
        color: primaryColor,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
