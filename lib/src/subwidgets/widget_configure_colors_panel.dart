import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colortheme_creator/src/provider/color_scheme_manager_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import 'helper_widgets.dart';

class ConfigureColorsPanel extends ConsumerWidget {
  const ConfigureColorsPanel({
    super.key,
    // required this.updateColorAndStateCallback,
    // required this.getColorCallback,
    // required this.currentColor,
    // required this.colThemeData,
  });

  // /* did not use a provider to learn how to do
  //    it the setState callback-passing way */
  // final Function updateColorAndStateCallback;
  // final Function getColorCallback;
  // final Color currentColor;
  // final ThemeData colThemeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemeManager = ref.watch(colorSchemeManagerProvider.notifier);

    return Column(
      children: [
        /* ---------------------------------------------------------------- */
        Text("Configuring colors"),

        /* -------------------------------------onPressed: () => setRandom_second(updateColors),--------------------------- */
        Column(
          children: [
            ColButtonBox(
              onPressed: null,
              caption: "Use as seed for App-Theme (NYI)",
            ),
            // Divider(),
            // ColButtonBox(
            //   onPressed: () => showColorPicker(),
            //   caption: "show color picker",
            // ),
            Row(
              children: [
                Expanded(child: SizedBox(height: 10)),
                Container(
                  decoration: WidgetDeco.boxDecoStd,
                  child: ColorPicker(
                    pickerColor: colorSchemeManager.getSeedColor(),
                    // pickerColor: currentColor,
                    // print("prints from onColorChanged. Color:\t $color")),
                    onColorChanged: (color) =>
                        colorSchemeManager.setSeedColor(color),
                  ),
                ),
                Expanded(child: SizedBox(height: 10)),
              ],
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
              onPressed: () {},
              caption: "Save SeedColor SOMEHOW (NYI)",
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              /* ---------------------------------------------------------------- */
              child: Text("ExampleWidget for PrimaryColor:"),
              /* ---------------------------------------------------------------- */
            ),
            getExampleWidgetForChosenColors(colorSchemeManager.getThemeData()),
            Text("ExampleWidget for SecondaryColor:"),
          ],
        ),
      ],
    );
  }

  void setNewColor(WidgetRef ref, Color newColor) {
    ref.read(colorSchemeManagerProvider.notifier).setSeedColor(newColor);
  }

}

Widget getExampleWidgetForChosenColors(ThemeData colThemeData) {
  return ConstrainedBox(
    constraints: BoxConstraints(maxHeight: 800, maxWidth: 600),
    child: Column(
      children: [
        SizedBox(
          // height: 40,
          width: 400,
          // height: 400,
          child: Container(
            color: colThemeData.primaryColor,
            child: Column(
              children: [
                Text("BackgroundColor: primaryColor"),
                Text("Text has color: default"),
                Text(
                  style: TextStyle(color: colThemeData.primaryColorLight),
                  "Text has color: primaryColorLight",
                ),
                Text(
                  style: TextStyle(color: colThemeData.primaryColorDark),
                  "Text has color: primaryColorDark",
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          // height: 40,
          width: 400,
          child: Container(
            color: colThemeData.primaryColorLight,
            child: Column(
              children: [
                Text("BackgroundColor: primaryColorLight"),
                Text("Text has color: default"),
                Text(
                  style: TextStyle(color: colThemeData.primaryColor),
                  "Text has color: primaryColor",
                ),
                Text(
                  style: TextStyle(color: colThemeData.primaryColorDark),
                  "Text has color: primaryColorDark",
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          // height: 40,
          width: 400,
          child: Container(
            color: colThemeData.primaryColorDark,
            child: Column(
              children: [
                Text("BackgroundColor: primaryColorDark"),
                Text("Text has color: default"),
                Text(
                  style: TextStyle(color: colThemeData.primaryColor),
                  "Text has color: primaryColor",
                ),
                Text(
                  style: TextStyle(color: colThemeData.primaryColorLight),
                  "Text has color: primaryColorLight",
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
