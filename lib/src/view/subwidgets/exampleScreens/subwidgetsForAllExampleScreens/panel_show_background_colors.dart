import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../../../flutter_colortheme_creator.dart';
import '../../mini_color_box.dart';

/// This class defines a this widget:
/// A Panel that gives a quick overview over the colors that are
/// normally used for setting the background of widgets when using themes.
///
/// surface,
/// container,
///
class PanelShowBackgroundColors extends ConsumerWidget {
  const PanelShowBackgroundColors({
    super.key,
    required this.colorScheme,
    required this.themeController,
  });

  final ColorScheme colorScheme;
  final ThemeController themeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Row(
        children: [
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text("Background-Colors:", textAlign: TextAlign.center),
              // Container(
              //   margin: EdgeInsets.only(bottom: 2),
              //   decoration: WidgetDeco.createBoxDeco(
              //     colBorder: colorScheme.onSurface,
              //     colBackground: colorScheme.surface,
              //   ),
              //   child: MiniColorBox(
              //     themeController: themeController,
              //     color: colorScheme.surface,
              //     caption: "surface",
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 2),
              //   decoration: WidgetDeco.createBoxDeco(
              //     colBorder: colorScheme.onSurface,
              //     colBackground: colorScheme.surface,
              //   ),
              //   child: MiniColorBox(
              //     themeController: themeController,
              //     color: colorScheme.primary,
              //     caption: "container",
              //   ),
              // ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surface,
                caption: "surface",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.primaryContainer,
                caption: "primaryContainer",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surfaceBright,
                caption: "surfaceBright",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surfaceContainer,
                caption: "surfaceContainer",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surfaceContainerHigh,
                caption: "surfaceContainerHigh",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surfaceContainerHighest,
                caption: "surfaceContainerHighest",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surfaceContainerLow,
                caption: "surfaceContainerLow",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surfaceContainerLowest,
                caption: "surfaceContainerLowest",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surfaceDim,
                caption: "surfaceDim",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.surfaceTint,
                caption: "surfaceTint",
              ),

              /* // PRIMARY   */
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.primaryFixed,
                caption: "primaryFixed",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.primaryContainer,
                caption: "primaryContainer",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.onPrimaryContainer,
                caption: "primaryContainer",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.onPrimary,
                caption: "onPrimary",
              ),
              _BackgroundContainer(
                themeController: themeController,
                colorScheme: colorScheme,
                color: colorScheme.inversePrimary,
                caption: "inversePrimary",
              ),

              /* // SECONDARY   */

              /* // TERTIARY   */
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class _BackgroundContainer extends ConsumerWidget {
  const _BackgroundContainer({
    super.key,
    required this.themeController,
    required this.colorScheme,
    required this.color,
    required this.caption,
  });

  final ThemeController themeController;
  final ColorScheme colorScheme;
  final Color color;

  final String caption;

  //   @override
  //   Widget build(BuildContext context, WidgetRef ref) {
  //     return Container(
  //       margin: EdgeInsets.only(bottom: 2),
  //       decoration: WidgetDeco.createBoxDeco(
  //         colBorder: colorScheme.onSurface,
  //         // colBackground: colorScheme.surface,
  //       ),
  //       child: MiniColorBox(
  //         themeController: themeController,
  //         color: color,
  //         caption: caption,
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      // decoration: WidgetDeco.createBoxDeco(
      //   colBorder: colorScheme.onSurface,
      //   // colBackground: colorScheme.surface,
      // ),
      child: MiniColorBox(
        themeController: themeController,
        color: color,
        caption: caption,
      ),
    );
  }
}
