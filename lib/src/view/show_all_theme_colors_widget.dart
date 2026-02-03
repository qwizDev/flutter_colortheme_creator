import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../provider/theme_state_provider.dart';
import 'subwidgets/widget_currently_chosen_color.dart';
import 'subwidgets/widget_showing_current_colors.dart';
import 'subwidgets/widget_themecolors_in_use.dart';
import 'subwidgets/widget_configure_colors_panel.dart';

class ShowAllThemeColorsWidget extends ConsumerStatefulWidget {
  const ShowAllThemeColorsWidget({super.key, this.title = "noTitleGiven"});
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ContentWidgetThemeColor();
  }
  
}

class _ContentWidgetThemeColor extends ConsumerState<ConsumerStatefulWidget> {
  _ContentWidgetThemeColor();

  late ThemeData _customThemeData;

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeStateProvider);

    _customThemeData = themeState.themeData;


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
}

// _customThemeData.primaryColor
// _customThemeData.primaryColorDark
// _customThemeData.primaryColorLight
// _customThemeData.secondaryHeaderColor
// _customThemeData.colorScheme.primary
// _customThemeData.colorScheme.tertiary
// _customThemeData.colorScheme.tertiaryContainer
