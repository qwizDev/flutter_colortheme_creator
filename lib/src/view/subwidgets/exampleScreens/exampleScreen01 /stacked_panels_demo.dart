import 'package:flutter/material.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class StackedPanelsDemo extends StatelessWidget {
  StackedPanelsDemo({
    super.key,
    required this.colScheme,
    required this.colorType,
  });
  final ColorScheme colScheme;
  final String colorType;
  late final Color mainCol;
  late final Color container;
  late final Color lowest;
  late final Color low;
  late final Color high;
  late final Color highest;

  @override
  Widget build(BuildContext context) {
    computePanelColors(colorType);

    return Column(
      children: [
        SizedBox(
          width: 600,
          height: 300,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: colScheme.outline),
              color: lowest,
            ),
            child: Padding(
              padding: EdgeInsets.all(WidgetDeco.paddingBoxInPanel),
              child: SizedBox(
                width: 500,
                height: 260,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colScheme.outline),
                    color: low,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(WidgetDeco.paddingForColorListing),
                    child: SizedBox(
                      width: 400,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: colScheme.outline),
                          color: high,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            WidgetDeco.paddingForColorListing,
                          ),
                          child: SizedBox(
                            width: 300,
                            height: 160,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: colScheme.outline),
                                color: highest,
                              ),
                              child: Text(
                                "CONTENT",
                                style: TextStyle(
                                  color: mainCol,
                                  fontSize: Theme.of(
                                    context,
                                  ).textTheme.headlineLarge?.fontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void computePanelColors(String colorType) {
    late CorePalette palette;
    switch (colorType) {
      case 'primary':
        palette = CorePalette.of(colScheme.primary.value);
        mainCol = colScheme.primary;
        container = colScheme.primaryContainer;
        lowest = colScheme.surfaceContainerLowest;
        low = colScheme.surfaceContainerLow;
        high = colScheme.surfaceContainerHigh;
        highest = colScheme.surfaceContainerHighest;
        break;
      case 'secondary':
        mainCol = colScheme.secondary;
        // continue 'tertiary';
        container = colScheme.secondaryContainer;
        lowest = colScheme.surfaceContainerLowest;
        low = colScheme.surfaceContainerLow;
        high = colScheme.surfaceContainerHigh;
        highest = colScheme.surfaceContainerHighest;
        break;
      case 'tertiary':
        mainCol = colScheme.tertiary;
        container = colScheme.tertiaryContainer;
        lowest = colScheme.surfaceContainerLowest;
        low = colScheme.surfaceContainerLow;
        high = colScheme.surfaceContainerHigh;
        highest = colScheme.surfaceContainerHighest;
        break;
      // default:
    }
  }
}
