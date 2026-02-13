import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/view/util/helpers.dart';
import 'helper_widgets.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

class DisplayWidgetThemeColorsInUse extends StatelessWidget {
  const DisplayWidgetThemeColorsInUse({
    super.key,
    required this.colorScheme,
    required this.appliedColorScheme,
  });

  final ColorScheme colorScheme;
  final AppliedColorScheme appliedColorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /* ---------------------------------------------------------------- */
        Headline(text: "Colors of colorscheme: ${appliedColorScheme.name}"),

        /* ---------------------------------------------------------------- */
        // SizedBox(
        //   width: _colorPanelWidth,
        //   height: _colorPanelHeigth,
        Column(
          children: [
            ...buildColorBoxes(context),

            // ...buildColorBoxes_oldWay(context),
          ],
        ),
      ],
    );
  }

  List<Widget> buildColorBoxes(BuildContext context) {
    return [
      ConstrainedColorBox(
        col: colorScheme.primary,
        givenColorCaption: "primary",
        context: context,
      ),
      ConstrainedColorBox(
        col: colorScheme.onPrimary,
        givenColorCaption: "onPrimary",
        context: context,
      ),
      ConstrainedColorBox(
        col: colorScheme.primaryContainer,
        givenColorCaption: "primaryContainer",
        context: context,
      ),
      ConstrainedColorBox(
        col: colorScheme.onPrimaryContainer,
        givenColorCaption: "onPrimaryContainer",
        context: context,
      ),
      ConstrainedColorBox(
        col: colorScheme.primaryFixed,
        givenColorCaption: "primaryFixed",
        context: context,
      ),
      ConstrainedColorBox(
        col: colorScheme.onPrimaryFixed,
        givenColorCaption: "onPrimaryFixed",
        context: context,
      ),

      ConstrainedColorBox(
        col: colorScheme.primaryFixedDim,
        givenColorCaption: "onPrimaryFixed",
        context: context,
      ),
      ConstrainedColorBox(
        col: colorScheme.onPrimaryFixedVariant,
        givenColorCaption: "onPrimaryFixedVariant",
        context: context,
      ),
      Padding(
        padding: const EdgeInsets.all(WidgetDeco.paddingBoxInPanel),
        child: Text("more colors to be added..."),
      ),
    ];
  }

  List<Widget> buildColorBoxes_oldWay(BuildContext context) {
    return [
      ConstrainedColorBox(
        col: Theme.of(context).primaryColor,
        givenColorCaption: "primaryColor",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).primaryColorDark,
        givenColorCaption: "primaryColorDark",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).primaryColorLight,
        givenColorCaption: "primaryColorLight",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).colorScheme.primary,
        givenColorCaption: "primary",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).colorScheme.onPrimary,
        givenColorCaption: "onPrimary",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).colorScheme.primaryContainer,
        givenColorCaption: "primaryContainer",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).colorScheme.secondary,
        givenColorCaption: "secondary",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).colorScheme.primary,
        givenColorCaption: "primary",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).colorScheme.tertiary,
        givenColorCaption: "tertiary",
        context: context,
      ),
      ConstrainedColorBox(
        col: Theme.of(context).colorScheme.tertiaryContainer,
        givenColorCaption: "tertiaryContainer",
        context: context,
      ),
    ];
  }
}
