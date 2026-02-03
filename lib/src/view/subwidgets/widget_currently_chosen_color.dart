import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colortheme_creator/src/view/subwidgets/helper_widgets.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

class DisplayWidgetForCurrentlyChosenColor extends ConsumerWidget {
  const DisplayWidgetForCurrentlyChosenColor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);
    final themeData = themeState.themeData;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NiceText("Colors for currently chosen color:"),
        ),
        ColButtonBox(
          onPressed: () => ref
              .read(themeStateProvider.notifier)
              .setSeedColor(buildRandomColor()),
          caption: "use a random color",
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text("Current Seedcolor: ${themeState.seedColor}"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ConstrainedColorBox(
                  col: themeData.primaryColor,
                  givenColorCaption: "primaryColor",
                ),
                ConstrainedColorBox(
                  col: themeData.primaryColorDark,
                  givenColorCaption: "primaryColorDark",
                ),
                ConstrainedColorBox(
                  col: themeData.primaryColorLight,
                  givenColorCaption: "primaryColorLight",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.primary,
                  givenColorCaption: "colorScheme.colorScheme.primary",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.onPrimary,
                  givenColorCaption: "colorScheme.colorScheme.onPrimary",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.primaryContainer,
                  givenColorCaption: "colorScheme.colorScheme.primaryContainer",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.surface,
                  givenColorCaption: "colorScheme.colorScheme.surface",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.surfaceContainerLowest,
                  givenColorCaption:
                      "colorScheme.colorScheme.surfaceContainerLowest",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.surfaceContainerHighest,
                  givenColorCaption:
                      "colorScheme.colorScheme.surfaceContainerHighest",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.secondary,
                  givenColorCaption: "colorScheme.secondary",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.onSecondary,
                  givenColorCaption: "colorScheme.onSecondary",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.secondaryContainer,
                  givenColorCaption: "colorScheme.secondaryContainer",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.tertiary,
                  givenColorCaption: "colorScheme.tertiary",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.onTertiary,
                  givenColorCaption: "colorScheme.onTertiary",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.tertiaryContainer,
                  givenColorCaption: "colorScheme.tertiaryContainer",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.inversePrimary,
                  givenColorCaption: "colorScheme.inversePrimary",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.inverseSurface,
                  givenColorCaption: "colorScheme.inverseSurface",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.outline,
                  givenColorCaption: "colorScheme.outline",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.scrim,
                  givenColorCaption: "colorScheme.scrim",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.surfaceContainerHighest,
                  givenColorCaption: "colorScheme.surfaceContainerHighest",
                ),
                ConstrainedColorBox(
                  col: themeData.colorScheme.surfaceContainerLowest,
                  givenColorCaption: "colorScheme.surfaceContainerLowest",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
