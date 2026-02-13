import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colortheme_creator/flutter_colortheme_creator.dart';
import 'package:flutter_colortheme_creator/src/provider/custom_color_scheme_data_provider.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import 'subwidgets/button_panel_for_color_scheme_creation.dart';
import 'subwidgets/dev_panel_switch_themes.dart';
import 'subwidgets/exampleScreens/exampleScreen01 /widget_example_screen_01.dart';
import 'subwidgets/panel_color_role_choser.dart';
import 'subwidgets/panel_show_colors_from_color_scheme.dart';
import 'util/helpers.dart';

class ThemeColorCreatorWidget extends ConsumerStatefulWidget {
  const ThemeColorCreatorWidget({
    super.key,
    this.title = "noTitleGiven",
    required this.themeController,
  });
  final String title;
  final ThemeController themeController;

  @override
  ConsumerState<ThemeColorCreatorWidget> createState() {
    return _ContentWidgetThemeColor();
  }
}

class _ContentWidgetThemeColor extends ConsumerState<ThemeColorCreatorWidget> {
  _ContentWidgetThemeColor();

  // late Color _chosenColor;
  late ColorScheme _ownCustomColorScheme;
  late ColorScheme _colorScheme;
  late ColorSchemeKey? radioColorKey = ColorSchemeKey.primary;
  late final ThemeController themeController = widget.themeController;
  late Color _chosenColor;

  final ColorScheme copiedScheme = ColorScheme(
    primary: Colors.blue,
    secondary: Colors.green,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
    // More colors
  );

  @override
  Widget build(BuildContext context) {
    _colorScheme = ref.watch(themeStateProvider).colorScheme;

    _ownCustomColorScheme = ref
        .watch(customColorschemeDataProvider(themeController))
        .customColorScheme;

    _chosenColor = ref
        .watch(customColorschemeDataProvider(themeController))
        .chosenColor;

    // _ownCustomColorScheme = ref.watch(themeStateProvider).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        // return ConstrainedBox(
        //   constraints: BoxConstraints(maxWidth: constraints.maxWidth),
        return SizedBox(
          width: constraints.maxWidth, // <- DAS ist entscheidend

          child: SingleChildScrollView(
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 900),

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppBar(
                        backgroundColor: _colorScheme.primary,
                        centerTitle: true,
                        title: Text(
                          "ThemeColor-Creator",
                          style: TextStyle(color: _colorScheme.inversePrimary),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Pick colors and create your own custom colorScheme",
                              style: TextStyle(
                                fontSize: Theme.of(
                                  context,
                                ).textTheme.headlineMedium?.fontSize,
                              ),
                            ),
                          ),

                          /* //COLORPICKER AND SOME DEV BUTTONS IN A ROW */
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: WidgetDeco.boxDecoStd,
                                child: ColorPicker(
                                  pickerColor: _chosenColor,
                                  onColorChanged: (color) =>
                                      Helpers.applyChosenColor(
                                        ref,
                                        themeController,
                                        color,
                                      ),
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxHeight: 300),
                                child: ButtonPanelForColorSchemeCreation(
                                  themeController: themeController,
                                ),
                              ),
                            ],
                          ),
                          DevPanelSwitchThemes(
                            themeController: themeController,
                          ),

                          // IntrinsicHeight(
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //PANEL SHOWING COLOR-ROLE-NAMES AND CUSTOM COLORS
                                  Text("customColorScheme:"),
                                  PanelShowColorsFromColScheme(
                                    colScheme: _ownCustomColorScheme,
                                  ),
                                ],
                              ),

                              /* //PANEL SHOWING RADIOBUTTONS AND COLOR-ROLE NAMES */
                              PanelColorRoleChoser(
                                themeController: themeController,
                              ),
                            ],
                          ),
                          /* //AGAIN: PANEL WITH ButtonPanelForColorSchemeCreation BUT AS A ROW NOW */
                          ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 300),
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: WidgetDeco.paddingBoxInPanel * 10,
                              ),
                              child: ButtonPanelForColorSchemeCreation(
                                themeController: themeController,
                                givenButtonsToUse: [
                                  ButtonsForColorSchemeCreation.useThisColor,
                                  ButtonsForColorSchemeCreation
                                      .createAndUseTheme,
                                ],
                                asRow: true,
                              ),
                            ),
                          ),
                          ExampleScreen01(themeController: themeController),
                        ],
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     children: [Text("fsadfasdfasdfsadfasdfasd")],
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
