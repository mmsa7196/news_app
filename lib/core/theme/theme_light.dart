import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'base_theme.dart';
class LightTheme extends BaseTheme {
  @override
  Color get secondaryColor =>  Colors.white;

  @override
  Color get primaryColor => const Color(0xff171717);

  @override
  Color get iconColor => const Color(0xff808080);

  @override
  ThemeData get themeData => ThemeData(
        focusColor: const Color(0xff7B7B7B),
        primaryColor: primaryColor,
        unselectedWidgetColor: primaryColor,
        hintColor: secondaryColor,
        scaffoldBackgroundColor: secondaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: secondaryColor,
          elevation: 0,
          centerTitle: true,
          iconTheme:  IconThemeData(
            color:primaryColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xff7B7B7B), width: 2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xff7B7B7B), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xff7B7B7B), width: 2),
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
            color: secondaryColor,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 29,
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
