import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colortheme_creator/src/provider/custom_color_scheme_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../flutter_colortheme_creator.dart';
import '../util/helpers.dart';
import 'helper_widgets.dart';

class ConfigureColorsPanel extends ConsumerWidget {
  const ConfigureColorsPanel({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(customColorSchemeDataProvider(themeController));

    return Column(
      children: [
        Headline(text: "Configuring colors"),
        Column(
          children: [
            ColButtonBox(
              caption: "Use as seed for App-Theme (NYI)",
              onPressed: null,
            ),
            Container(
              alignment: Alignment.center,
              decoration: WidgetDeco.boxDecoStd,
              child: ColorPicker(
                pickerColor: themeData.chosenColor,
                onColorChanged: (color) =>
                    Helpers.applyChosenColor(ref, themeController, color),
              ),
            ),

            //   pickerColor: themeData.seedColor,
            //   onColorChanged: (color) => ref
            //       .read(
            //         customColorSchemeDataProvider(themeController).notifier,
            //       )
            //       .setSeedColor(color),
            // ),
            ColButtonBox(
              caption: "use a random color",
              onPressed: () => setNewColor(ref, buildRandomColor()),
            ),
            ColButtonBox(
              caption: "use yellow",
              onPressed: () => setNewColor(ref, Colors.yellow),
            ),
            ColButtonBox(
              caption: "create and apply theme to app",
              onPressed: () {
                final String themeName = DateTime.now().toIso8601String();
                themeController.addThemeToList(
                  themeName,
                  ref
                      .read(customColorSchemeDataProvider(themeController))
                      .customColorScheme,
                  true,
                );
                themeController.applyTheme(themeName);
              },
            ),
            ColButtonBox(onPressed: () {}, caption: "save ColorScheme (NYI)"),
            // Divider(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Headline(text: "ExampleWidget for PrimaryColor:"),
            // ),
          ],
        ),
      ],
    );
  }

  void setNewColor(WidgetRef ref, Color newColor) {
    ref
        .read(customColorSchemeDataProvider(themeController).notifier)
        .setSeedColor(newColor);
  }
}
