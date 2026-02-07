import 'package:flutter/material.dart';
import 'helper_widgets.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

class DisplayWidgetThemeColorsInUse extends StatelessWidget {
  const DisplayWidgetThemeColorsInUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /* ---------------------------------------------------------------- */
        Headline(text: "Colors of theme being in use"),
        
        /* ---------------------------------------------------------------- */
        // SizedBox(
        //   width: _colorPanelWidth,
        //   height: _colorPanelHeigth,
        Column(
          children: [
            ConstrainedColorBox(
              col: Theme.of(context).primaryColor,
              givenColorCaption: "primaryColor" ,
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
          ],
        ),
      ],
    );
  }
}
