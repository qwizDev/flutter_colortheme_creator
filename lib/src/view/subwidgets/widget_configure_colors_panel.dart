import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../flutter_colortheme_creator.dart';
import 'helper_widgets.dart';
import 'widget_example_for_chosen_colors.dart';

class ConfigureColorsPanel extends ConsumerWidget {
  const ConfigureColorsPanel({
    super.key,
    required this.themeController,
    // required this.updateColorAndStateCallback,
    // required this.getColorCallback,
    // required this.currentColor,
    // required this.colThemeData,
  });

  final ThemeController themeController;

  // /* did not use a provider to learn how to do
  //    it the setState callback-passing way */
  // final Function updateColorAndStateCallback;
  // final Function getColorCallback;
  // final Color currentColor;
  // final ThemeData colThemeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeStateProvider);

    return Column(
      children: [
        Headline(text: "Configuring colors"),
        Column(
          children: [
            ColButtonBox(
              onPressed: null,
              caption: "Use as seed for App-Theme (NYI)",
            ),
            // ColButtonBox(
            //   onPressed: () => showColorPicker(),
            //   caption: "show color picker",
            // ),
            Container(
              alignment: Alignment.center,
              decoration: WidgetDeco.boxDecoStd,
              child: ColorPicker(
                pickerColor: themeData.seedColor,
                // pickerColor: currentColor,
                // print("prints from onColorChanged. Color:\t $color")),
                onColorChanged: (color) =>
                    ref.read(themeStateProvider.notifier).setSeedColor(color),
              ),
            ),
            ColButtonBox(
              onPressed: () => setNewColor(ref, buildRandomColor()),

              caption: "use a random color",
            ),
            ColButtonBox(
              onPressed: () => setNewColor(ref, Colors.yellow),
              caption: "use yellow",
            ),
            ColButtonBox(
              // onPressed: () {createAndAddThemeToApp(ref)},
              // onPressed: () {themeController.addThemeToList(DateTime.now().toIso8601String(),
              //   ref.read(themeStateProvider).colorScheme, true);},
              onPressed: () {
                final String themeName = DateTime.now().toIso8601String();
                themeController.addThemeToList(
                  themeName,
                  ref.read(themeStateProvider).colorScheme,
                  true,
                );
                themeController.applyTheme(themeName);
              },

              caption: "create and apply theme to app",
            ),
            ColButtonBox(
              onPressed: () {},
              caption: "save ColorScheme (NYI)",
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Headline(text: "ExampleWidget for PrimaryColor:"),
            ),
            ExampleWidgetForChosenColors(),
          ],
        ),
      ],
    );
  }

  void setNewColor(WidgetRef ref, Color newColor) {
    ref.read(themeStateProvider.notifier).setSeedColor(newColor);
  }

  void createAndAddThemeToApp(WidgetRef ref) {
    // ref.read();
  }
}
