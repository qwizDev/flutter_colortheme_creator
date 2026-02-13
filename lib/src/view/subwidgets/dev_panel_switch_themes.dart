import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../flutter_colortheme_creator.dart';
import '../../provider/custom_color_scheme_data_provider.dart';

class DevPanelSwitchThemes extends ConsumerWidget {
  const DevPanelSwitchThemes({super.key, required this.themeController});

  final ThemeController themeController;

  static const double paddingBetweenButtons = WidgetDeco.paddingButtonsBetween;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(WidgetDeco.paddingPanelOnScreen),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsetsGeometry.all(
                      paddingBetweenButtons,
                    ),
                    child: ButtonStd(labelText: "Theme light", () {
                      setNewTheme(ref, "light");
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsetsGeometry.all(
                      paddingBetweenButtons,
                    ),
                    child: ButtonStd(labelText: "Theme dark", () {
                      setNewTheme(ref, "dark");
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsetsGeometry.all(
                      paddingBetweenButtons,
                    ),
                    child: ButtonStd(labelText: "Papagei light", () {
                      setNewTheme(ref, "papageiLight");
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsetsGeometry.all(
                      paddingBetweenButtons,
                    ),
                    child: ButtonStd(labelText: "Papagei dark", () {
                      setNewTheme(ref, "papageiDark");
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsetsGeometry.all(
                      paddingBetweenButtons,
                    ),
                    child: ButtonStd(labelText: "walk through themes", () {
                      walkThroughThemesOnePerClick(ref, themeController);
                    }),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsetsGeometry.all(
                      paddingBetweenButtons,
                    ),
                    child: ButtonStd(labelText: "save theme (file) (NYI)", () {
                      themeController.resetThemeList();
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsetsGeometry.all(
                      paddingBetweenButtons,
                    ),
                    child: ButtonStd(labelText: "load themes (file) (NYI)", () {
                      themeController.resetThemeList();
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsetsGeometry.all(
                      paddingBetweenButtons,
                    ),
                    child: ButtonStd(labelText: "reset themes", () {
                      themeController.resetThemeList();
                    }),
                  ),
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
