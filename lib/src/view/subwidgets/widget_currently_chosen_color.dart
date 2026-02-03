
import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colortheme_creator/src/view/subwidgets/helper_widgets.dart';


class DisplayWidgetForCurrentlyChosenColor extends ConsumerWidget {
  const DisplayWidgetForCurrentlyChosenColor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeState = ref.watch(themeStateProvider).themeData;

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
                      col: themeState.primaryColor,
                      givenColorCaption: "primaryColor",
                    ),
                    ConstrainedColorBox(
                      col: themeState.primaryColorDark,
                      givenColorCaption: "primaryColorDark",
                    ),
                    ConstrainedColorBox(
                      col: themeState.primaryColorLight,
                      givenColorCaption: "primaryColorLight",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.primary,
                      givenColorCaption:
                          "colorScheme.colorScheme.primary",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.onPrimary,
                      givenColorCaption:
                          "colorScheme.colorScheme.onPrimary",
                    ),
                    ConstrainedColorBox(
                      col:
                          themeState.colorScheme.primaryContainer,
                      givenColorCaption:
                          "colorScheme.colorScheme.primaryContainer",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.surface,
                      givenColorCaption:
                          "colorScheme.colorScheme.surface",
                    ),
                    ConstrainedColorBox(
                      col: themeState
                          .colorScheme
                          .surfaceContainerLowest,
                      givenColorCaption:
                          "colorScheme.colorScheme.surfaceContainerLowest",
                    ),
                    ConstrainedColorBox(
                      col: themeState
                          .colorScheme
                          .surfaceContainerHighest,
                      givenColorCaption:
                          "colorScheme.colorScheme.surfaceContainerHighest",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.secondary,
                      givenColorCaption: "colorScheme.secondary",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.onSecondary,
                      givenColorCaption: "colorScheme.onSecondary",
                    ),
                    ConstrainedColorBox(
                      col: themeState
                          .colorScheme
                          .secondaryContainer,
                      givenColorCaption:
                          "colorScheme.secondaryContainer",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.tertiary,
                      givenColorCaption: "colorScheme.tertiary",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.onTertiary,
                      givenColorCaption: "colorScheme.onTertiary",
                    ),
                    ConstrainedColorBox(
                      col: themeState
                          .colorScheme
                          .tertiaryContainer,
                      givenColorCaption:
                          "colorScheme.tertiaryContainer",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.inversePrimary,
                      givenColorCaption: "colorScheme.inversePrimary",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.inverseSurface,
                      givenColorCaption: "colorScheme.inverseSurface",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.outline,
                      givenColorCaption: "colorScheme.outline",
                    ),
                    ConstrainedColorBox(
                      col: themeState.colorScheme.scrim,
                      givenColorCaption: "colorScheme.scrim",
                    ),
                    ConstrainedColorBox(
                      col: themeState
                          .colorScheme
                          .surfaceContainerHighest,
                      givenColorCaption:
                          "colorScheme.surfaceContainerHighest",
                    ),
                    ConstrainedColorBox(
                      col: themeState
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
