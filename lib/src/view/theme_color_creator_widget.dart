import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/flutter_colortheme_creator.dart';
import 'package:flutter_colortheme_creator/src/provider/custom_color_scheme_data_provider.dart';
import 'package:flutter_colortheme_creator/src/provider/radio_value_for_color_role.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'guiConstants/gui_constants_for_package.dart';
import 'subwidgets/colorpicker_and_buttons_widget.dart';
import 'subwidgets/dev_panel_switch_themes.dart';
import 'subwidgets/exampleScreens/exampleScreen01 /widget_example_screen_01.dart';

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

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //COLORPICKER AND SOME DEV BUTTONS IN A ROW
                              ColorPickerAndButtonsWidget(
                                themeController: themeController,
                              ),
                            ],
                          ),
                        ],
                      ),
                      DevPanelSwitchThemes(themeController: themeController),

                      // IntrinsicHeight(
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //PANEL SHOWING COLOR-ROLE-NAMES AND CUSTOM COLORS
                              Text("customColorScheme:"),
                              PanelColorsFromColScheme(
                                colScheme: _ownCustomColorScheme,
                              ),
                            ],
                          ),

                          //PANEL SHOWING RADIOBUTTONS AND COLOR-ROLE NAMES
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 1000,
                                  maxWidth: 300,
                                ),

                                // height: 600,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Select Color to set up"),
                                      for (ColorSchemeKey radVal
                                          in ColorSchemeKey.values)
                                        ListTile(
                                          contentPadding: EdgeInsets.all(0),
                                          minVerticalPadding: 0,
                                          minTileHeight: 25,
                                          // title: Text(radVal.name),
                                          // onTap: () {
                                          //   useThisColorAsPickerColor(
                                          //     ref,
                                          //     radVal,
                                          //   );
                                          // },
                                          title: GestureDetector(
                                            onDoubleTap: () {
                                              useThisColorAsPickerColor(
                                                ref,
                                                radVal,
                                              );
                                            },
                                            child: Text(radVal.name),
                                          ),

                                          // onTap: () {
                                          //   useThisColorAsPickerColor(
                                          //     ref,
                                          //     radVal,
                                          //   );
                                          // },
                                          leading: Radio<ColorSchemeKey>(
                                            value: radVal,
                                            groupValue: radioColorKey,
                                            onChanged: (ColorSchemeKey? value) {
                                              setState(() {
                                                radioColorKey = value;
                                              });

                                              ref
                                                  .read(
                                                    radioValueForColorRoleProvider
                                                        .notifier,
                                                  )
                                                  .setValue(value);
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ExampleScreen01(themeController: themeController),
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

  void useThisColorAsPickerColor(WidgetRef ref, ColorSchemeKey radVal) {
    final Map<ColorSchemeKey, Color> colorSchemeAsMap = ColorSchemeHelper.toMap(
      ref
          .read(customColorschemeDataProvider(themeController))
          .customColorScheme,
    );

    final colorToSet = colorSchemeAsMap[radVal] ?? Colors.amber;

    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setChosenColor(colorToSet);
  }
}

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

class PanelColorsFromColScheme extends StatelessWidget {
  const PanelColorsFromColScheme({required this.colScheme, super.key});

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

class MiniColorBox extends StatelessWidget {
  MiniColorBox({super.key, required this.color, required this.caption});

  final double width = 160;

  final double height = GuiConstantsForPackage.heightOfAColorLine - 2;
  final Color color;
  final String caption;

  @override
  Widget build(Object context) {
    return Row(
      children: [
        SizedBox(width: width, height: height, child: Text(caption)),
        Container(
          decoration: BoxDecoration(color: color, border: Border.all()),
          child: SizedBox(width: width, height: height),
        ),
      ],
    );
  }
}

class ExampleButtonPlusDescription extends StatelessWidget {
  const ExampleButtonPlusDescription({
    super.key,
    required this.nameOfTextCol,
    required this.nameOfBackgroundCol,
    required this.foregroundCol,
    required this.backgroundCol,
  });

  final String nameOfTextCol;
  final String nameOfBackgroundCol;
  final Color foregroundCol;
  final Color? backgroundCol;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("foreground: $nameOfTextCol"),
        Text("background: $nameOfBackgroundCol"),
        ExampleButton(
          caption: "ExampleButton",
          foregroundCol: foregroundCol,
          backgroundCol: backgroundCol,
        ),
      ],
    );
  }
}

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    required this.caption,
    required this.foregroundCol,
    required this.backgroundCol,
  });

  final String caption;
  final Color foregroundCol;
  final Color? backgroundCol;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundCol),
      ),
      child: Text(
        caption,
        style: TextStyle(
          color: foregroundCol,
          // backgroundColor: backgroundCol,
        ),
      ),
    );
  }
}
