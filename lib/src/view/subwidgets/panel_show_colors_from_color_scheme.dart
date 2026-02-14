import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/flutter_colortheme_creator.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import 'mini_color_box.dart';

class PanelShowColorsFromColScheme extends StatelessWidget {
  const PanelShowColorsFromColScheme({
    required this.themeController,
    required this.colScheme,
    super.key,
  });

  final ThemeController themeController;
  final ColorScheme colScheme;

  @override
  Widget build(BuildContext context) {
    final Map<ColorSchemeKey, Color> colorSchemeAsMap = ColorSchemeHelper.toMap(
      colScheme,
    );

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),

          child: ListView.builder(
            shrinkWrap: true,
            itemCount: ColorSchemeKey.values.length,
            itemBuilder: (context, index) {
              return MiniColorBox(
                themeController: themeController,
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
