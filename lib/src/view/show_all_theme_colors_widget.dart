import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/provider/custom_color_scheme_data_provider.dart';
import 'package:flutter_colortheme_creator/src/view/util/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../provider/theme_controller.dart';
import '../provider/theme_state_provider.dart';
import 'subwidgets/dev_panel_switch_themes.dart';
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

  @override
  Widget build(BuildContext context) {
    // final themeState = ref.watch(themeStateProvider);
    // _customThemeData = themeState.themeData;

    // final colSchemeAppWide = ref.watch(themeStateProvider).colorScheme;
    final colSchemeAppWide = Theme.of(context).colorScheme;

    final colSchemeOwnCustom = ref
        .watch(customColorschemeDataProvider(themeController))
        .customColorScheme;

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
                DisplayWidgetThemeColorsInUse(
                  colorScheme: colSchemeAppWide,
                  appliedColorScheme: AppliedColorScheme.appWide,
                ),
                Divider(),
                DevPanelSwitchThemes(themeController: themeController),
                Divider(),
                DisplayWidgetThemeColorsInUse(
                  colorScheme: colSchemeOwnCustom,
                  appliedColorScheme: AppliedColorScheme.ownCustom,
                ),
                Divider(),
                DevPanelSwitchThemes(themeController: themeController),
                Divider(),
                ExampleWidgetShowingCurrentColors(
                  colorScheme: colSchemeOwnCustom,
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
