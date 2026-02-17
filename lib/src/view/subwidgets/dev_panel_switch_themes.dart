import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../flutter_colortheme_creator.dart';
import '../../provider/custom_color_scheme_data_provider.dart';

class DevPanelSwitchThemes extends ConsumerWidget {
  DevPanelSwitchThemes({super.key, required this.themeController});

  final ThemeController themeController;
  late Color _chosenColor;
  static const double paddingBetweenButtons = WidgetDeco.paddingButtonsBetween;

  final double _labelSizeMin = 300;
  late double _fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double? tmpFontSize = Theme.of(context).textTheme.bodyLarge?.fontSize;
    if (tmpFontSize != null) {
      tmpFontSize = tmpFontSize * 1.1;
    }

    _fontSize = tmpFontSize ?? 24;

    _chosenColor = ref
        .watch(customColorSchemeDataProvider(themeController))
        .chosenColor;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          // padding: const EdgeInsets.all(WidgetDeco.paddingPanelOnScreen),
          padding: const EdgeInsets.only(top: WidgetDeco.paddingPanelOnScreen),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...buildDevButtons(ref),
              Padding(
                // padding: EdgeInsetsGeometry.symmetric(
                //   vertical: WidgetDeco.paddingBoxInPanel,
                // ),
                padding: EdgeInsetsGeometry.only(
                  bottom: WidgetDeco.paddingBoxInPanel,
                ),

                child: Column(
                  children: [
                    ...buildCurrentThemeCurrentColorInfoWidgets(ref, context),
                  ],
                ),
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
        .read(customColorSchemeDataProvider(themeController).notifier)
        .setCustomColorScheme(useThemesColSchemeOrFallback(theme));
  }

  void walkThroughThemesOnePerClick(
    WidgetRef ref,
    ThemeController themeController,
  ) async {
    await themeController.walkThroughThemesOnePerClick();
    final theme = themeController.getCurrentThemeData();
    ref
        .read(customColorSchemeDataProvider(themeController).notifier)
        .setCustomColorScheme(useThemesColSchemeOrFallback(theme));
  }

  ColorScheme useThemesColSchemeOrFallback(ThemeData? theme) {
    return theme?.colorScheme ?? ThemeData.fallback().colorScheme;
  }

  List<Widget> buildDevButtons(WidgetRef ref) {
    return [
      Wrap(
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(labelText: "Theme light", fontSize: _fontSize, () {
              setNewTheme(ref, "light");
            }),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(labelText: "Theme dark", fontSize: _fontSize, () {
              setNewTheme(ref, "dark");
            }),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "Papagei light",
              fontSize: _fontSize,
              () {
                setNewTheme(ref, "papageiLight");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "Papagei dark",
              fontSize: _fontSize,
              () {
                setNewTheme(ref, "papageiDark");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "Papagei papageiBasedFirstOwnLight",
              fontSize: _fontSize,
              () {
                setNewTheme(ref, "papageiBasedFirstOwnLight");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "Papagei papageiBasedFirstOwnDark",
              fontSize: _fontSize,
              () {
                setNewTheme(ref, "papageiBasedFirstOwnDark");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "papageiBasedLight002A1",
              fontSize: _fontSize,
              () {
                setNewTheme(ref, "papageiBasedLight002A1");
              },
            ),
          ),

          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "papageiBasedDark002A1",
              fontSize: _fontSize,
              () {
                setNewTheme(ref, "papageiBasedDark002A1");
              },
            ),
          ),

          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "walk through themes",
              fontSize: _fontSize,
              () {
                walkThroughThemesOnePerClick(ref, themeController);
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "save theme (file) (NYI)",
              fontSize: _fontSize,
              () {},
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "load themes (file) (NYI)",
              fontSize: _fontSize,
              () {},
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.all(paddingBetweenButtons),
            child: ButtonStd(
              labelText: "reset themes",
              fontSize: _fontSize,
              () {
                themeController.resetThemeList();
              },
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> buildCurrentThemeCurrentColorInfoWidgets(
    WidgetRef ref,
    BuildContext context,
  ) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: WidgetDeco.paddingPanelOnScreen),
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,

          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: WidgetDeco.paddingPanelOnScreen,
            ),
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: _labelSizeMin),
                  child: Text(
                    "Theme:",
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: _labelSizeMin),
                  child: Text(
                    themeController.getCurrentThemeName(),
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: WidgetDeco.paddingPanelOnScreen,
        ),
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: WidgetDeco.paddingPanelOnScreen,
            ),
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: _labelSizeMin),
                  child: Text(
                    "Current Color:",
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: _labelSizeMin),
                  child: SelectableText(
                    colorToHex(_chosenColor),
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
