import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_scheme_manager_provider.g.dart';

@Riverpod(keepAlive: true)
class ColorSchemeManager extends _$ColorSchemeManager {
  final Color _startColor = Colors.red; //Colors.blue
  late Color _seedColor;
  late ThemeData _themeData;

  @override
  ColorScheme build() {
    // chosenColor = const Color.fromARGB(255, 129, 226, 44);
    _seedColor = _startColor;

    return ColorScheme.fromSeed(seedColor: _seedColor);
  }

  void createColorSchemeFromThisColor(Color seedColor) {
    state = ColorScheme.fromSeed(seedColor: seedColor);
  }

  Color getSeedColor() {
    return _seedColor;
  }

  void setSeedColor(Color newColor) {
    _seedColor = newColor;
    createColorSchemeFromThisColor(_seedColor);
    createThemeDataFromColorScheme();
  }

  ThemeData createThemeDataFromColorScheme() {
    return _themeData = ThemeData(
      // colorScheme: _customScheme,
      colorScheme: state,
      useMaterial3: true,
    );
  }

  ThemeData getThemeData() {
    if (_themeData != null) {
     _themeData =  createThemeDataFromColorScheme();
    }
    return _themeData;
  
  }
}
