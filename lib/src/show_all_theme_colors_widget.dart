import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/src/provider/color_scheme_manager_provider.dart';
import '/src/subwidgets/widget_currently_chosen_color.dart';
import '/src/subwidgets/widget_showing_current_colors.dart';
import '/src/subwidgets/widget_themecolors_in_use.dart';

import 'package:gui_creation_helper/gui_creation_helper.dart';

import 'subwidgets/helper_widgets.dart';
import 'subwidgets/widget_configure_colors_panel.dart';

class ShowAllThemeColorsWidget extends ConsumerStatefulWidget {
  const ShowAllThemeColorsWidget({super.key, this.title = "noTitleGiven"});
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ContentWidgetThemeColor();
  }

  // void printThemeDataStuff(BuildContext context) {
  //   ThemeData stuff = Theme.of(context);
  //   for (var elem in stuff.colorScheme) {
  //     print(elem.toString());
  //   }
  // }
}

class _ContentWidgetThemeColor extends ConsumerState<ConsumerStatefulWidget> {
  _ContentWidgetThemeColor();

  late final Color _chosenColor;
  late final ThemeData _customThemeData;

  @override
  Widget build(BuildContext context) {
    final colorSchemeManager = ref.watch(colorSchemeManagerProvider.notifier);

    _chosenColor = colorSchemeManager.getSeedColor();

    _customThemeData = colorSchemeManager.createThemeDataFromColorScheme();

    // final int redPartOfColor = _chosenColor.red;
    // final int greenPartOfColor = _chosenColor.green;
    // final int bluePartOfColor = _chosenColor.blue;

    // final String _chosenColorString =
    //     "RED: $redPartOfColor, GREEN: $greenPartOfColor, BLUE: $bluePartOfColor";

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 800),
        child: Container(
          decoration: WidgetDeco.boxDecoStd,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DisplayWidgetThemeColorsInUse(),
                Divider(),
                ColButtonBox(
                  onPressed: () => setNewColor(ref, buildRandomColor()),
                  caption: "use a random color",
                ),
                // Divider(),
                DisplayWidgetForCurrentlyChosenColor(),
                ExampleWidgetShowingCurrentColors(
                  customThemeData: _customThemeData,
                ),
                Divider(),
                ConfigureColorsPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setNewColor(WidgetRef ref, Color newColor) {
    ref.read(colorSchemeManagerProvider.notifier).setSeedColor(newColor);
  }

  void updateColors(Color newColor) {
    ref.read(colorSchemeManagerProvider.notifier).setSeedColor(newColor);
  }

  Color getCurrentColor() {
    return ref.read(colorSchemeManagerProvider.notifier).getSeedColor();
  }
}

// _customThemeData.primaryColor
// _customThemeData.primaryColorDark
// _customThemeData.primaryColorLight
// _customThemeData.secondaryHeaderColor
// _customThemeData.colorScheme.primary
// _customThemeData.colorScheme.tertiary
// _customThemeData.colorScheme.tertiaryContainer
