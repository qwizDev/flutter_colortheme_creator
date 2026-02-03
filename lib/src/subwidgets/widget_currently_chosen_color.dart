
import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/provider/color_scheme_manager_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colortheme_creator/src/subwidgets/helper_widgets.dart';


class DisplayWidgetForCurrentlyChosenColor extends ConsumerWidget {
  const DisplayWidgetForCurrentlyChosenColor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final customThemeData = ref.watch(colorSchemeManagerProvider.notifier).getThemeData();

    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            /* ---------------------------------------------------------------- */
            child: Text("Colors for currently chosen color:"),
            /* ---------------------------------------------------------------- */
          ),
          // Text(chosenColorString),
          Text("chosenColorString: checks outcommented stuff "),
          // Text(chosenColor.toString()),
          Text("chosenColor.toString(): checks outcommented stuff "),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                // SizedBox(
                //   width: _colorPanelWidth,
                //   height: _colorPanelHeigth,
                // ConstrainedBox.expand(
                //   constraints: BoxConstraints(
                //     minHeight: 50,
                //     maxHeight: _colorPanelHeigth * 2,
                //     minWidth: 100,
                //     maxWidth: _colorPanelWidth,
                //   ),
                // child: Column(
                Column(
                  children: [
                    ConstrainedColorBox(
                      col: customThemeData.primaryColor,
                      givenColorCaption: "primaryColor",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.primaryColorDark,
                      givenColorCaption: "primaryColorDark",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.primaryColorLight,
                      givenColorCaption: "primaryColorLight",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.primary,
                      givenColorCaption:
                          "colorScheme.colorScheme.primary",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.onPrimary,
                      givenColorCaption:
                          "colorScheme.colorScheme.onPrimary",
                    ),
                    ConstrainedColorBox(
                      col:
                          customThemeData.colorScheme.primaryContainer,
                      givenColorCaption:
                          "colorScheme.colorScheme.primaryContainer",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.surface,
                      givenColorCaption:
                          "colorScheme.colorScheme.surface",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData
                          .colorScheme
                          .surfaceContainerLowest,
                      givenColorCaption:
                          "colorScheme.colorScheme.surfaceContainerLowest",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData
                          .colorScheme
                          .surfaceContainerHighest,
                      givenColorCaption:
                          "colorScheme.colorScheme.surfaceContainerHighest",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.secondary,
                      givenColorCaption: "colorScheme.secondary",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.onSecondary,
                      givenColorCaption: "colorScheme.onSecondary",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData
                          .colorScheme
                          .secondaryContainer,
                      givenColorCaption:
                          "colorScheme.secondaryContainer",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.tertiary,
                      givenColorCaption: "colorScheme.tertiary",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.onTertiary,
                      givenColorCaption: "colorScheme.onTertiary",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData
                          .colorScheme
                          .tertiaryContainer,
                      givenColorCaption:
                          "colorScheme.tertiaryContainer",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.inversePrimary,
                      givenColorCaption: "colorScheme.inversePrimary",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.inverseSurface,
                      givenColorCaption: "colorScheme.inverseSurface",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.outline,
                      givenColorCaption: "colorScheme.outline",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData.colorScheme.scrim,
                      givenColorCaption: "colorScheme.scrim",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData
                          .colorScheme
                          .surfaceContainerHighest,
                      givenColorCaption:
                          "colorScheme.surfaceContainerHighest",
                    ),
                    ConstrainedColorBox(
                      col: customThemeData
                          .colorScheme
                          .surfaceContainerLowest,
                      givenColorCaption:
                          "colorScheme.surfaceContainerLowest",
                    ),
                  ],
                ),
              ],
            ),
        ],
      );

  }
}
