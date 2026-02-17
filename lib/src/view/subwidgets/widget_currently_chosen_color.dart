import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/provider/custom_color_scheme_data_provider.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colortheme_creator/src/view/subwidgets/helper_widgets.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

class DisplayWidgetForAllColorSchemeColors extends ConsumerWidget {
  const DisplayWidgetForAllColorSchemeColors({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customColorSchemeData = ref.watch(
      customColorSchemeDataProvider(themeController),
    );
    final customColorScheme = customColorSchemeData.customColorScheme;
    final String currentSeedColor = buildColorString(
      customColorSchemeData.seedColor,
    );
    // return ConstrainedBox(
    //   constraints: BoxConstraints(
    //     maxHeight: 2000,
    //   ),
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Headline(text: "Colors for currently chosen color:"),
        ),
        ColButtonBox(
          onPressed: () => ref
              .read(customColorSchemeDataProvider(themeController).notifier)
              .setSeedColor(buildRandomColor()),
          caption: "use a random color",
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          // child: Text("Current Seedcolor: ${themeState.seedColor}"),
          // child: Text("Current Seedcolor: ${buildColorString(themeState.seedColor)}"),
          child: Text("current Seedcolor: $currentSeedColor"),
        ),
        Column(
          children: [
            // ConstrainedColorBox(
            //   col: themeData.primaryColor,
            //   givenColorCaption: "themeData.primaryColor",
            //   context: context,
            // ),
            // ConstrainedColorBox(
            //   col: themeData.primaryColorDark,
            //   givenColorCaption: "themeData.primaryColorDark",
            //   context: context,
            // ),
            // ConstrainedColorBox(
            //   col: themeData.primaryColorLight,
            //   givenColorCaption: "themeData.primaryColorLight",
            //   context: context,
            // ),
            ConstrainedColorBox(
              col: customColorScheme.primary,
              givenColorCaption: "primary",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.onPrimary,
              givenColorCaption: "onPrimary",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.primaryContainer,
              givenColorCaption: "primaryContainer",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.surface,
              givenColorCaption: "surface",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.surfaceContainerLowest,
              givenColorCaption: "surfaceContainerLowest",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.surfaceContainerHighest,
              givenColorCaption: "surfaceContainerHighest",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.secondary,
              givenColorCaption: "secondary",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.onSecondary,
              givenColorCaption: "onSecondary",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.secondaryContainer,
              givenColorCaption: "secondaryContainer",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.tertiary,
              givenColorCaption: "tertiary",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.onTertiary,
              givenColorCaption: "onTertiary",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.tertiaryContainer,
              givenColorCaption: "tertiaryContainer",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.inversePrimary,
              givenColorCaption: "inversePrimary",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.inverseSurface,
              givenColorCaption: "inverseSurface",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.outline,
              givenColorCaption: "outline",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.scrim,
              givenColorCaption: "scrim",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.surfaceContainerHighest,
              givenColorCaption: "surfaceContainerHighest",
              context: context,
            ),
            ConstrainedColorBox(
              col: customColorScheme.surfaceContainerLowest,
              givenColorCaption: "surfaceContainerLowest",
              context: context,
            ),
          ],
        ),
      ],
    );
  }
}
