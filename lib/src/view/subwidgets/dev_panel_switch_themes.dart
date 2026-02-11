import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../flutter_colortheme_creator.dart';
import '../../provider/custom_color_scheme_data_provider.dart';

class DevPanelSwitchThemes extends ConsumerWidget {
  const DevPanelSwitchThemes({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200, minHeight: 100),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(WidgetDeco.paddingPanelOnScreen),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                children: [
                  ButtonStd(labelText: "Theme light", () {
                    setNewTheme(ref, "light");
                  }),
                  ButtonStd(labelText: "Theme dark", () {
                    setNewTheme(ref, "dark");
                  }),
                  ButtonStd(labelText: "Papagei light", () {
                    setNewTheme(ref, "papageiLight");
                  }),
                  ButtonStd(labelText: "Papagei dark", () {
                    setNewTheme(ref, "papageiDark");
                  }),
                  ButtonStd(labelText: "walk through themes", () {
                    walkThroughThemesOnePerClick(ref, themeController);
                  }),
                  ButtonStd(labelText: "reset themes", () {
                    themeController.resetThemeList();
                  }),
                ],
              ),
              Text(
                "last loaded theme: ${themeController.getCurrentThemeName()}",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setNewTheme(WidgetRef ref, String nameOfTheme) {
    themeController.applyTheme(nameOfTheme);

    /*  also set _ownCustomColorScheme */
    final theme = themeController.getCurrentThemeData();
    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setCustomColorScheme(useThemesColSchemeOrFallback(theme));
  }

  void walkThroughThemesOnePerClick(
    WidgetRef ref,
    ThemeController themeController,
  ) async {
    await themeController.walkThroughThemesOnePerClick();
    final theme = themeController.getCurrentThemeData();
    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setCustomColorScheme(useThemesColSchemeOrFallback(theme));
  }

  ColorScheme useThemesColSchemeOrFallback(ThemeData? theme) {
    return theme?.colorScheme ?? ThemeData.fallback().colorScheme;
  }
}
