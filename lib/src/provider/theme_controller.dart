import 'package:flutter/material.dart';

abstract class ThemeController {
  ThemeData? getThemeData(String name);
  // void setThemeData(ThemeData themeData, String name);

  Map<String, ThemeData> getAllThemes();

  String getCurrentThemeName();

  ThemeData? getCurrentThemeData();

  void addThemeToList(String name, ColorScheme colorScheme, bool isBrightTheme);

  void applyTheme(String themeToApply);

  void replaceThisTheme(String themeToReplace, ThemeData newTheme);

  void removeThemeFromList(String nameOfTheme);

  Future<bool> walkThroughThemesOnePerClick();

  void resetThemeList();
}
