import 'package:flutter/material.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import 'mini_color_box.dart';

class PanelShowColorsFromColScheme extends StatelessWidget {
  const PanelShowColorsFromColScheme({required this.colScheme, super.key});

  final ColorScheme colScheme;

  @override
  Widget build(BuildContext context) {
    final Map<ColorSchemeKey, Color> colorSchemeAsMap = ColorSchemeHelper.toMap(
      colScheme,
    );

    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        // MiniColorBox(color: colScheme.primary, caption: "primary"),
        // MiniColorBox(color: colScheme.onPrimary, caption: "onPrimary"),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),

          child: ListView.builder(
            shrinkWrap: true,
            itemCount: ColorSchemeKey.values.length,
            itemBuilder: (context, index) {
              return MiniColorBox(
                color:
                    colorSchemeAsMap[ColorSchemeKey.values[index]] ??
                    Colors.amber,
                caption: ColorSchemeKey.values[index].name,
              );
            },
          ),
        ),
      ],
    );
  }
}
