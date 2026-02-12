import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../theme_color_creator_widget.dart';
import 'panel_demo.dart';

class ExampleScreen01 extends ConsumerWidget {
  late final ColorScheme _colorScheme;

  ExampleScreen01({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _colorScheme = ref.read(themeStateProvider).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: _colorScheme.outline),
                color: _colorScheme.surface,
              ),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: _colorScheme.primary,
                    centerTitle: true,
                    title: Text(
                      "Navbar/AppExample",
                      style: TextStyle(color: _colorScheme.inversePrimary),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PanelDemo(
                        colScheme: _colorScheme,
                        kindOfThemeCol: "primary",
                      ),
                      PanelDemo(
                        colScheme: _colorScheme,
                        kindOfThemeCol: "secondary",
                      ),
                      PanelDemo(
                        colScheme: _colorScheme,
                        kindOfThemeCol: "tertiary",
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(WidgetDeco.paddingForColorListing),
                    child: Column(
                      children: [
                        // Text(
                        //   "Button-Row: PRIMARY: foreground is primary. background as caption of button sasy.",
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "primary",
                              nameOfBackgroundCol: "inversePrimary",
                              foregroundCol: _colorScheme.primary,
                              backgroundCol: _colorScheme.inversePrimary,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "primary",
                              nameOfBackgroundCol: "null",
                              foregroundCol: _colorScheme.primary,
                              backgroundCol: null,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "primary",
                              nameOfBackgroundCol: "primaryContainer",
                              foregroundCol: _colorScheme.primary,
                              backgroundCol: _colorScheme.primaryContainer,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "inversePrimary",
                              nameOfBackgroundCol: "primary",
                              foregroundCol: _colorScheme.inversePrimary,
                              backgroundCol: _colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(WidgetDeco.paddingForColorListing),
                    child: Column(
                      children: [
                        // Text("Button-Row: SECONDARY"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "secondary",
                              nameOfBackgroundCol: "onSecondary",
                              foregroundCol: _colorScheme.secondary,
                              backgroundCol: _colorScheme.onSecondary,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "secondary",
                              nameOfBackgroundCol: "null",
                              foregroundCol: _colorScheme.secondary,
                              backgroundCol: null,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "secondary",
                              nameOfBackgroundCol: "secondaryContainer",
                              foregroundCol: _colorScheme.secondary,
                              backgroundCol: _colorScheme.secondaryContainer,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "onSecondary",
                              nameOfBackgroundCol: "secondary",
                              foregroundCol: _colorScheme.onSecondary,
                              backgroundCol: _colorScheme.secondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(WidgetDeco.paddingForColorListing),
                    child: Column(
                      children: [
                        Text("Button-Row: TERTIARY"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "tertiary",
                              nameOfBackgroundCol: "onTertiary",
                              foregroundCol: _colorScheme.tertiary,
                              backgroundCol: _colorScheme.onTertiary,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "tertiary",
                              nameOfBackgroundCol: "null",
                              foregroundCol: _colorScheme.tertiary,
                              backgroundCol: null,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "tertiary",
                              nameOfBackgroundCol: "tertiaryContainer",
                              foregroundCol: _colorScheme.tertiary,
                              backgroundCol: _colorScheme.tertiaryContainer,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "onTertiary",
                              nameOfBackgroundCol: "tertiary",
                              foregroundCol: _colorScheme.onTertiary,
                              backgroundCol: _colorScheme.tertiary,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                            WidgetDeco.paddingForColorListing * 2,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 600,
                                height: 1200,
                                child: Container(
                                  color: _colorScheme.primaryContainer,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(
                                          WidgetDeco.paddingForColorListing,
                                        ),
                                        child: Text(
                                          style: TextStyle(
                                            fontSize: Theme.of(
                                              context,
                                            ).textTheme.headlineLarge?.fontSize,
                                            color: _colorScheme.primary,
                                          ),
                                          "An Article about Colors",
                                        ),
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Text(
                                        style: TextStyle(
                                          fontSize: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.fontSize,
                                        ),
                                        "abc def abc def abc def abc def abc def abc def ",
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                          WidgetDeco.paddingForColorListing * 2,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ExampleButton(
                                              caption: "Button Std",
                                              foregroundCol:
                                                  _colorScheme.primary,
                                              backgroundCol: null,
                                            ),
                                            ExampleButton(
                                              caption: "Button Std",
                                              foregroundCol:
                                                  _colorScheme.primary,
                                              backgroundCol: _colorScheme
                                                  .surfaceContainerLowest,
                                            ),
                                            ExampleButton(
                                              caption: "Button Std",
                                              foregroundCol:
                                                  _colorScheme.inversePrimary,
                                              backgroundCol:
                                                  _colorScheme.primary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // StackedPanelsDemo(
                  //   colScheme: _colorScheme,
                  //   colorType: "primary",
                  // ),
                  // StackedPanelsDemo(
                  //   colScheme: _colorScheme,
                  //   colorType: "secondary",
                  // ),
                  // StackedPanelsDemo(
                  //   colScheme: _colorScheme,
                  //   colorType: "tertiary",
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
