import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/flutter_colortheme_creator.dart';
import 'package:flutter_colortheme_creator/src/provider/custom_color_scheme_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../theme_color_creator_widget.dart';
import '../../example_buttons.dart';
import 'panel_demo.dart';

class ExampleScreen01 extends ConsumerWidget {
  // late final ColorScheme _colorScheme;
  late final ColorScheme _ownCustomColorScheme;
  late final ThemeController themeController;

  ExampleScreen01({super.key, required this.themeController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // _colorScheme = ref.read(themeStateProvider).colorScheme;

    _ownCustomColorScheme = ref
        .read(customColorschemeDataProvider(themeController))
        .customColorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: _ownCustomColorScheme.outline),
                color: _ownCustomColorScheme.surface,
              ),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: _ownCustomColorScheme.primary,
                    centerTitle: true,
                    title: Text(
                      "Navbar/AppExample",
                      style: TextStyle(
                        color: _ownCustomColorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PanelDemo(
                        colScheme: _ownCustomColorScheme,
                        kindOfThemeCol: "primary",
                      ),
                      PanelDemo(
                        colScheme: _ownCustomColorScheme,
                        kindOfThemeCol: "secondary",
                      ),
                      PanelDemo(
                        colScheme: _ownCustomColorScheme,
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
                              foregroundCol: _ownCustomColorScheme.primary,
                              backgroundCol:
                                  _ownCustomColorScheme.inversePrimary,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "primary",
                              nameOfBackgroundCol: "null",
                              foregroundCol: _ownCustomColorScheme.primary,
                              backgroundCol: null,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "primary",
                              nameOfBackgroundCol: "primaryContainer",
                              foregroundCol: _ownCustomColorScheme.primary,
                              backgroundCol:
                                  _ownCustomColorScheme.primaryContainer,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "inversePrimary",
                              nameOfBackgroundCol: "primary",
                              foregroundCol:
                                  _ownCustomColorScheme.inversePrimary,
                              backgroundCol: _ownCustomColorScheme.primary,
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
                              foregroundCol: _ownCustomColorScheme.secondary,
                              backgroundCol: _ownCustomColorScheme.onSecondary,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "secondary",
                              nameOfBackgroundCol: "null",
                              foregroundCol: _ownCustomColorScheme.secondary,
                              backgroundCol: null,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "secondary",
                              nameOfBackgroundCol: "secondaryContainer",
                              foregroundCol: _ownCustomColorScheme.secondary,
                              backgroundCol:
                                  _ownCustomColorScheme.secondaryContainer,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "onSecondary",
                              nameOfBackgroundCol: "secondary",
                              foregroundCol: _ownCustomColorScheme.onSecondary,
                              backgroundCol: _ownCustomColorScheme.secondary,
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
                              foregroundCol: _ownCustomColorScheme.tertiary,
                              backgroundCol: _ownCustomColorScheme.onTertiary,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "tertiary",
                              nameOfBackgroundCol: "null",
                              foregroundCol: _ownCustomColorScheme.tertiary,
                              backgroundCol: null,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "tertiary",
                              nameOfBackgroundCol: "tertiaryContainer",
                              foregroundCol: _ownCustomColorScheme.tertiary,
                              backgroundCol:
                                  _ownCustomColorScheme.tertiaryContainer,
                            ),
                            ExampleButtonPlusDescription(
                              nameOfTextCol: "onTertiary",
                              nameOfBackgroundCol: "tertiary",
                              foregroundCol: _ownCustomColorScheme.onTertiary,
                              backgroundCol: _ownCustomColorScheme.tertiary,
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
                                  color: _ownCustomColorScheme.primaryContainer,
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
                                            color:
                                                _ownCustomColorScheme.primary,
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
                                                  _ownCustomColorScheme.primary,
                                              backgroundCol: null,
                                            ),
                                            ExampleButton(
                                              caption: "Button Std",
                                              foregroundCol:
                                                  _ownCustomColorScheme.primary,
                                              backgroundCol:
                                                  _ownCustomColorScheme
                                                      .surfaceContainerLowest,
                                            ),
                                            ExampleButton(
                                              caption: "Button Std",
                                              foregroundCol:
                                                  _ownCustomColorScheme
                                                      .inversePrimary,
                                              backgroundCol:
                                                  _ownCustomColorScheme.primary,
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
