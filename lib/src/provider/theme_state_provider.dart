import 'package:flutter/material.dart';
import '/src/model/themedata_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_state_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeState extends _$ThemeState {
  final Color _startColor = Colors.red; //Colors.blue
  late Color _seedColor;
  late ThemeData _themeData;
  late ColorScheme _colorScheme;

  @override
  ThemeDataState build() {
    // chosenColor = const Color.fromARGB(255, 129, 226, 44);
    _seedColor = _startColor;

    _colorScheme = ColorScheme.fromSeed(seedColor: _seedColor);
    _themeData = ThemeData(colorScheme: _colorScheme);
    return ThemeDataState(
      colorScheme: _colorScheme,
      seedColor: _seedColor,
      themeData: _themeData,
    );
  }

  void setSeedColor(Color newColor) {
    _seedColor = newColor;
    _colorScheme = ColorScheme.fromSeed(seedColor: newColor);
    _themeData = _createThemeDataFromColorScheme(_colorScheme);
    state = ThemeDataState(
      seedColor: newColor,
      colorScheme: _colorScheme,
      themeData: _themeData,
    );
  }

  void setColorTheme(ColorScheme colorScheme) {
    state = ThemeDataState(
      seedColor: _seedColor,
      colorScheme: colorScheme,
      themeData: _themeData,
    );
  }

  void setThemeData(ThemeData themeData) {
    state = ThemeDataState(
      seedColor: _seedColor,
      colorScheme: _colorScheme,
      themeData: themeData,
    );
  }

  ThemeData _createThemeDataFromColorScheme(ColorScheme colorScheme) {
    return _themeData = ThemeData(colorScheme: colorScheme, useMaterial3: true);
  }

  ThemeData createCurrentThemeData() {
    return _themeData;
  }
}



// import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'color_scheme_manager_provider.g.dart';

// @Riverpod(keepAlive: true)
// class ColorSchemeManager extends _$ColorSchemeManager {
//   final Color _startColor = Colors.red; //Colors.blue
//   late Color _seedColor;
//   late ThemeData _themeData;

//   @override
//   ColorScheme build() {
//     // chosenColor = const Color.fromARGB(255, 129, 226, 44);
//     _seedColor = _startColor;

//     return ColorScheme.fromSeed(seedColor: _seedColor);
//   }

//   void createColorSchemeFromThisColor(Color seedColor) {
//     state = ColorScheme.fromSeed(seedColor: seedColor);
//   }

//   Color getSeedColor() {
//     return _seedColor;
//   }

//   void setSeedColor(Color newColor) {
//     _seedColor = newColor;
//     createColorSchemeFromThisColor(_seedColor);
//     createThemeDataFromColorScheme();
//   }

//   ThemeData createThemeDataFromColorScheme() {
//     return _themeData = ThemeData(
//       // colorScheme: _customScheme,
//       colorScheme: state,
//       useMaterial3: true,
//     );
//   }

//   ThemeData getThemeData() {
//     if (_themeData != null) {
//      _themeData =  createThemeDataFromColorScheme();
//     }
//     return _themeData;
  
//   }
// }
