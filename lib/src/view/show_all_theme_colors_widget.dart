import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../provider/theme_controller.dart';
import '../provider/theme_state_provider.dart';
import 'subwidgets/dev_panel_switch_themes.dart';
import 'subwidgets/widget_currently_chosen_color.dart';
import 'subwidgets/widget_showing_current_colors.dart';
import 'subwidgets/widget_themecolors_in_use.dart';
import 'subwidgets/widget_configure_colors_panel.dart';

class ShowAllThemeColorsWidget extends ConsumerStatefulWidget {
  const ShowAllThemeColorsWidget({
    super.key,
    this.title = "noTitleGiven",
    required this.themeController,
  });
  final String title;
  final ThemeController themeController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ShowAllThemeColorsWidget();
  }
}

class _ShowAllThemeColorsWidget
    extends ConsumerState<ShowAllThemeColorsWidget> {
  _ShowAllThemeColorsWidget();

  late final ThemeController themeController = widget.themeController;

  late ThemeData _customThemeData;

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeStateProvider);

    _customThemeData = themeState.themeData;

    return Center(
      child: Container(
        decoration: WidgetDeco.boxDecoStd,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
              maxWidth: 1000,
              minHeight: 10,
              maxHeight: 10000,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DevPanelSwitchThemes(themeController: themeController),
                Divider(),
                DisplayWidgetThemeColorsInUse(),
                Divider(),
                DevPanelSwitchThemes(themeController: themeController),
                Divider(),
                DisplayWidgetForCurrentlyChosenColor(),
                Divider(),
                DevPanelSwitchThemes(themeController: themeController),
                Divider(),
                ExampleWidgetShowingCurrentColors(
                  customThemeData: _customThemeData,
                ),
                Divider(),
                ConfigureColorsPanel(themeController: themeController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
