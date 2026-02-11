import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../flutter_colortheme_creator.dart';
import '../../provider/custom_colorscheme_data_provider.dart';

class DevPanelSwitchThemes extends ConsumerWidget {
  const DevPanelSwitchThemes({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 300, minHeight: 100),
      child: Container(
        // color: Colors.green,
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: Column(
            children: [
              Wrap(
                children: [
                  ButtonStd(labelText: "Theme light", () {
                    // themeController.applyTheme("light");
                    setNewTheme(ref, "light");
                  }),
                  ButtonStd(labelText: "Theme dark", () {
                    // themeController.applyTheme("dark");

                    // // ALSO SET _ownCustomColorScheme
                    // final theme = themeController.getCurrentThemeData();
                    // ref
                    //     .read(
                    //       customColorschemeDataProvider(
                    //         themeController,
                    //       ).notifier,
                    //     )
                    //     .setCustomColorScheme(
                    //       theme?.colorScheme ?? ThemeData.light().colorScheme,
                    //     );

                    setNewTheme(ref, "dark");
                  }),
                  ButtonStd(labelText: "Papagei light", () {
                    // themeController.applyTheme("papageiLight");
                    setNewTheme(ref, "papageiLight");
                  }),
                  ButtonStd(labelText: "Papagei dark", () {
                    // themeController.applyTheme("papageiDark");
                    setNewTheme(ref, "papageiDark");
                  }),
                  ButtonStd(labelText: "walk through themes", () {
                    themeController.walkThroughThemesOnePerClick();
                  }),
                  ButtonStd(labelText: "reset themes", () {
                    themeController.resetThemeList();
                    // themeController.applyTheme("light");
                    // setNewTheme(ref, "dark");

                    // ref
                    //       .read(customColorschemeDataProvider(themeController))
                    //       .customColorScheme,
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

    // ALSO SET _ownCustomColorScheme
    final theme = themeController.getCurrentThemeData();
    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setCustomColorScheme(
          theme?.colorScheme ?? ThemeData.light().colorScheme,
        );
  }
}
