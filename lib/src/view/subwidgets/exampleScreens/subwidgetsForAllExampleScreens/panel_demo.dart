import 'package:flutter/material.dart';
import 'package:material_color_utilities/hct/hct.dart';

class PanelDemo extends StatelessWidget {
  PanelDemo({super.key, required this.colScheme, required this.kindOfThemeCol});

  final ColorScheme colScheme;
  final String kindOfThemeCol;

  final String someFillText = "Text to fill the panel";

  late final Color mainCol;
  late final Color inverseCol;
  late final Color surfaceCol;
  late final Color containerCol;
  late final Color onContainerCol;

  @override
  Widget build(BuildContext context) {
    computeColorsToUse();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: containerCol, border: Border.all()),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            children: [
              Text(
                "Color: $kindOfThemeCol",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  color: mainCol,
                ),
              ),
              Text(someFillText, style: TextStyle(color: mainCol)),
              Text(
                "backgroundColor: container",
                style: TextStyle(color: mainCol),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void computeColorsToUse() {
    switch (kindOfThemeCol) {
      case "primary":
        mainCol = colScheme.primary;
        inverseCol = colScheme.inversePrimary;
        surfaceCol = colScheme.surface;
        containerCol = colScheme.primaryContainer;
        onContainerCol = colScheme.onPrimaryContainer;
        break;
      case "secondary":
        final Hct hct = Hct.fromInt(colScheme.secondary.value);
        final int onSecondaryTone = Hct.from(hct.hue, hct.chroma, 100).toInt();

        mainCol = colScheme.secondary;
        inverseCol = Color(onSecondaryTone);
        surfaceCol = colScheme.surface;
        containerCol = colScheme.secondaryContainer;
        onContainerCol = colScheme.onSecondaryContainer;
        break;
      case "tertiary":
        final Hct hct = Hct.fromInt(colScheme.tertiary.value);
        final int onTertiaryTone = Hct.from(hct.hue, hct.chroma, 100).toInt();
        mainCol = colScheme.tertiary;
        inverseCol = Color(onTertiaryTone);
        surfaceCol = colScheme.surface;
        containerCol = colScheme.tertiaryContainer;
        onContainerCol = colScheme.onTertiaryContainer;

        break;
      default:
    }
  }
}
