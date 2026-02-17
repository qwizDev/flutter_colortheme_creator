import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/model/color_scheme_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_controller.dart';

part 'custom_color_scheme_data_provider.g.dart';

/// This class defines a riverpod provider for all data related to our own customColorSchemeData.
/// (that is: the ColorScheme itself as well a Color chosencolor which is
/// needed for constructing and finetuning themes)
@Riverpod(keepAlive: true)
class CustomColorSchemeData extends _$CustomColorSchemeData {
  @override
  late ThemeController themeController;
  static const Color _startColor = Colors.green;

  @override
  ColorSchemeData build(ThemeController themeController) {
    this.themeController = themeController;

    return ColorSchemeData(
      customColorScheme: themeController.getCurrentThemeData().colorScheme,
      chosenColor: _startColor,
      seedColor: _startColor,
    );
  }

  void setCustomColorScheme(ColorScheme colorscheme) {
    state = state.copyWith(customColorScheme: colorscheme);
  }

  void setChosenColor(Color chosenCol) {
    state = state.copyWith(chosenColor: chosenCol);
  }

  void setSeedColor(Color chosenCol) {
    state = state.copyWith(chosenColor: chosenCol);
  }

  void resetCustomColorSchemeData() {
    state = build(themeController);
  }
}
