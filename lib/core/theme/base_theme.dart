import 'dart:ui';

import 'package:flutter/material.dart';

abstract class BaseTheme {
  Color get secondaryColor;

  Color get primaryColor;

  Color get iconColor;


  ThemeData get themeData;
}