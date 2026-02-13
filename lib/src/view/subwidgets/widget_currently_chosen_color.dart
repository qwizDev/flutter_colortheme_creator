import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colortheme_creator/src/view/subwidgets/helper_widgets.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

class DisplayWidgetForAllColorSchemeColors extends ConsumerWidget {
  const DisplayWidgetForAllColorSchemeColors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);
    final themeData = themeState.themeData;
    final String currentSeedColor = buildColorString(themeState.seedColor);
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
              .read(themeStateProvider.notifier)
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
            ConstrainedColorBox(
              col: themeData.primaryColor,
              givenColorCaption: "themeData.primaryColor",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.primaryColorDark,
              givenColorCaption: "themeData.primaryColorDark",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.primaryColorLight,
              givenColorCaption: "themeData.primaryColorLight",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.primary,
              givenColorCaption: "primary",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.onPrimary,
              givenColorCaption: "onPrimary",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.primaryContainer,
              givenColorCaption: "primaryContainer",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.surface,
              givenColorCaption: "surface",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.surfaceContainerLowest,
              givenColorCaption: "surfaceContainerLowest",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.surfaceContainerHighest,
              givenColorCaption: "surfaceContainerHighest",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.secondary,
              givenColorCaption: "secondary",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.onSecondary,
              givenColorCaption: "onSecondary",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.secondaryContainer,
              givenColorCaption: "secondaryContainer",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.tertiary,
              givenColorCaption: "tertiary",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.onTertiary,
              givenColorCaption: "onTertiary",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.tertiaryContainer,
              givenColorCaption: "tertiaryContainer",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.inversePrimary,
              givenColorCaption: "inversePrimary",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.inverseSurface,
              givenColorCaption: "inverseSurface",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.outline,
              givenColorCaption: "outline",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.scrim,
              givenColorCaption: "scrim",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.surfaceContainerHighest,
              givenColorCaption: "surfaceContainerHighest",
              context: context,
            ),
            ConstrainedColorBox(
              col: themeData.colorScheme.surfaceContainerLowest,
              givenColorCaption: "surfaceContainerLowest",
              context: context,
            ),
          ],
        ),
      ],
    );
  }
}
