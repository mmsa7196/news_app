import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String get currentLanguage => _currentLanguage;
  String _currentLanguage = 'en';
  ThemeMode themeMode = ThemeMode.light;
  MyProvider() {
    loadTheme();
  }

  loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("theme_mode") == "dark") {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  changeThemeMode(bool isLight) {
    if (isLight) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  cangeToLight() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    changeThemeMode(true);
    prefs.setString("theme_mode", "light");
    notifyListeners();
  }

  cangeToDark() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    changeThemeMode(false);
    prefs.setString("theme_mode", "dark");
    notifyListeners();
  }

  changeLocale(BuildContext context, String locale) async {
    final SharedPreferences shPref = await SharedPreferences.getInstance();
    if (shPref.getString("locale") != locale) {
      context.setLocale(Locale(locale));
      shPref.setString("locale", locale);
    }
    notifyListeners();
  }

  // Theme toggle method
  void changeTheme() {
    if (themeMode == ThemeMode.light) {
      cangeToDark();
    } else {
      cangeToLight();
    }
    notifyListeners();
  }
  void changeLanguage(BuildContext context, String language) {
    _currentLanguage = language;
    context.setLocale(Locale(language));
    notifyListeners();
  }
}