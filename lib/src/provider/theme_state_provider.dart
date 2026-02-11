import 'package:flutter/material.dart';
import '../model/theme_data_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_state_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeState extends _$ThemeState {
  final Color _startColor = Colors.green;

  @override
  ThemeDataState build() {
    return ThemeDataState(
      colorScheme: ThemeData.dark().colorScheme,
      seedColor: _startColor,
      themeData: ThemeData.dark(),
    );
  }

  void setSeedColor(Color newColor) {
    final colorScheme = ColorScheme.fromSeed(seedColor: newColor);
    final themeData = _createThemeDataFromColorScheme(colorScheme);
    state = ThemeDataState(
      seedColor: newColor,
      colorScheme: colorScheme,
      themeData: themeData,
    );
  }

  void setColorTheme(ColorScheme colorScheme) {
    state = state.copyWith(
      colorScheme: colorScheme,
      themeData: _createThemeDataFromColorScheme(colorScheme),
    );
  }

  void setThemeData(ThemeData themeData) {
    state = state.copyWith(
      themeData: themeData,
      colorScheme: themeData.colorScheme,
    );
  }

  ThemeData _createThemeDataFromColorScheme(ColorScheme colorScheme) {
    return ThemeData(colorScheme: colorScheme, useMaterial3: true);
  }
}
