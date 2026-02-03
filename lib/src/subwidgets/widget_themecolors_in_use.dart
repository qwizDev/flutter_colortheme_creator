import 'package:flutter/material.dart';
import '/src/subwidgets/helper_widgets.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

class DisplayWidgetThemeColorsInUse extends StatelessWidget {
  const DisplayWidgetThemeColorsInUse({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        Size(colorPanelWidth, colorPanelHeigth),
      ),
      child: Column(
        children: [
          /* ---------------------------------------------------------------- */
          Text("Colors of theme being in use"),

          /* ---------------------------------------------------------------- */
          // SizedBox(
          //   width: _colorPanelWidth,
          //   height: _colorPanelHeigth,
          Column(
            children: [
              ConstrainedColorBox(col: Theme.of(context).primaryColor),
              ConstrainedColorBox(col: Theme.of(context).primaryColorDark),
              ConstrainedColorBox(col: Theme.of(context).primaryColorLight),
              ConstrainedColorBox(col: Theme.of(context).colorScheme.primary),
              ConstrainedColorBox(col: Theme.of(context).colorScheme.onPrimary),
              ConstrainedColorBox(
                col: Theme.of(context).colorScheme.primaryContainer,
              ),
              ConstrainedColorBox(col: Theme.of(context).colorScheme.secondary),
              ConstrainedColorBox(col: Theme.of(context).colorScheme.primary),
              ConstrainedColorBox(col: Theme.of(context).colorScheme.tertiary),
              ConstrainedColorBox(
                col: Theme.of(context).colorScheme.tertiaryContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
