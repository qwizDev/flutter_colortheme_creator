import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/model/color_scheme_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_controller.dart';
import 'theme_state_provider.dart';

part 'custom_color_scheme_data_provider.g.dart';

@Riverpod(keepAlive: true)
class CustomColorschemeData extends _$CustomColorschemeData {
  @override
  late ThemeController themeController;

  @override
  ColorSchemeData build(ThemeController themeController) {
    this.themeController = themeController;

    return ColorSchemeData(
      customColorScheme: ref.watch(themeStateProvider).colorScheme,
      chosenColor: Colors.green,
    );
  }

  void setCustomColorScheme(ColorScheme colorscheme) {
    state = state.copyWith(customColorScheme: colorscheme);
  }

  void setChosenColor(Color chosenCol) {
    state = state.copyWith(chosenColor: chosenCol);
  }

  void resetCustomColorSchemeData() {
    build(themeController);
  }
}
