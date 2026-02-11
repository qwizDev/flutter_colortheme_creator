import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/model/colorscheme_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_controller.dart';
import 'theme_state_provider.dart';

part 'custom_colorscheme_data_provider.g.dart';

@Riverpod(keepAlive: true)
class CustomColorschemeData extends _$CustomColorschemeData {
  @override
  late final ThemeController themeController;

  @override
  ColorschemeData build(ThemeController themeController) {
    this.themeController = themeController;

    // ColorScheme fetchedScheme = themeController
    //     .getThemeData("light")!
    //     .colorScheme;

    // return ColorschemeData(
    //   // customColorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    //   customColorScheme: fetchedScheme,
    //   chosenColor: Colors.green,
    // );

    // return ColorschemeData(
    //   customColorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    //   chosenColor: Colors.green,
    // );

    // return ColorschemeData(
    //   customColorScheme: ref.read(themeStateProvider).colorScheme,
    //   chosenColor: Colors.green,
    // );
    return ColorschemeData(
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
