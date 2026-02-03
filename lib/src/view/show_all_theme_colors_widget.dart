import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/theme_state_provider.dart';
import 'subwidgets/widget_currently_chosen_color.dart';
import 'subwidgets/widget_showing_current_colors.dart';
import 'subwidgets/widget_themecolors_in_use.dart';

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

  late Color _chosenColor;
  late ThemeData _customThemeData;

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeStateProvider);

    _chosenColor = themeState.seedColor;

    _customThemeData = themeState.themeData;
    
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
    ref.read(themeStateProvider.notifier).setSeedColor(newColor);
  }

  void updateColors(Color newColor) {
    ref.read(themeStateProvider.notifier).setSeedColor(newColor);
  }

  Color getCurrentColor() {
    return ref.read(themeStateProvider).seedColor;
  }
}

// _customThemeData.primaryColor
// _customThemeData.primaryColorDark
// _customThemeData.primaryColorLight
// _customThemeData.secondaryHeaderColor
// _customThemeData.colorScheme.primary
// _customThemeData.colorScheme.tertiary
// _customThemeData.colorScheme.tertiaryContainer
