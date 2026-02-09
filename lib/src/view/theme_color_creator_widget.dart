import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colortheme_creator/flutter_colortheme_creator.dart';
import 'package:flutter_colortheme_creator/src/provider/theme_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

enum RadioValues {
  primary,
  onPrimary,
  inversePrimary,
  primaryContainer,
  onPrimaryContainer,
  secondary,
  onSecondary,
  secondaryContainer,
  onSecondaryContainer,
  tertiary,
  onTertiary,
  tertiaryContainer,
  onTertiaryContainer,
  surface,
  inverseSurface,
  surfaceBright,
  surfaceContainer,
  surfaceDim,
  surfaceTint,
  onSurface,
  onSurfaceVariant,
  surfaceContainerLowest,
  surfaceContainerLow,
  surfaceContainerHigh,
  surfaceContainerHighest,
  outline,
  outlineVariant,
  scrim,
  shadow,
}

final Color _startColor = Colors.blue;
final double paddingStd = 12;
final double textSizeStd = 12;
final double textSizeLarge = 20;
final double textSizehuge = 35;
final double colorLineHeight = 25;

// class ThemeColorCreatorWidget extends ConsumerWidget {
//   const ThemeColorCreatorWidget({
//     super.key,
//     this.title = "noTitleGiven",
//     required this.themeController,
//   });
//   final String title;
//   final ThemeController themeController;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ContentWidgetThemeColorCreator();
//   }

// }

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

  // late Color _chosenColor = _startColor;
  late Color _chosenColor;

  late ColorScheme _colorScheme;
  late ColorScheme _ownCustomColorScheme;
  late RadioValues? radioString = RadioValues.primary;
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
  void initState() {
    super.initState();
    // _colorScheme = ColorScheme.fromSeed(seedColor: _chosenColor);
    // _ownCustomColorScheme = copiedScheme;
    _colorScheme = ref.read(themeStateProvider).colorScheme;
    _ownCustomColorScheme = _colorScheme;
    _chosenColor = _colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeStateProvider);

    final buttonSizeMax = WidgetStateProperty.all(const Size(250, 250));
    final buttonSizeMin = WidgetStateProperty.all(const Size(250, 50));

    // _colorScheme = themeState.colorScheme;
    // _ownCustomColorScheme = themeState.colorScheme;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900),
        child: Column(
          children: [
            Column(
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Pick colors and create your own custom colorScheme",
                        style: TextStyle(fontSize: textSizeLarge),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //COLORPICKER AND SOME DEV BUTTONS IN A ROW
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: WidgetDeco.boxDecoStd,
                              child: ColorPicker(
                                pickerColor: _chosenColor,
                                onColorChanged: (color) =>
                                    applyChosenColor(color),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 300),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            maximumSize: buttonSizeMax,
                                            minimumSize: buttonSizeMin,
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                          ),
                                          onPressed: () =>
                                              useThisColorAsAColorRole(),
                                          child: Text("useThisColor"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            maximumSize: buttonSizeMax,
                                            minimumSize: buttonSizeMin,
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                          ),
                                          onPressed: () =>
                                              nowCreateAndUseTheme(),
                                          child: Text("nowCreateAndUseTheme"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            maximumSize: buttonSizeMax,
                                            minimumSize: buttonSizeMin,
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                          ),
                                          onPressed: () =>
                                              useColorAsSeedColor(),
                                          child: Text("useColorAsSeedColor"),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            maximumSize: buttonSizeMax,
                                            minimumSize: buttonSizeMin,
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                          ),
                                          // onPressed: setColorSchemeGlobally,
                                          onPressed: () {
                                            setColorSchemeGlobally(
                                              themeController,
                                            );
                                          },
                                          // onPressed: () {
                                          //   ref
                                          //       .read(themeStateProvider.notifier)
                                          //       .setSeedColor(_colorScheme.primary);
                                          // },
                                          child: Text("AS GLOBAL SCHEME-NYI"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("customColorScheme:"),
                        PanelColorsFromColScheme(colScheme: _colorScheme),
                      ],
                    ),
                    SizedBox(
                      width: 300,
                      // height: 600,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text("Select Color to set up"),
                            for (RadioValues radVal in RadioValues.values)
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                minVerticalPadding: 0,
                                minTileHeight: 25,
                                title: Text(radVal.name),
                                leading: Radio<RadioValues>(
                                  value: radVal,
                                  groupValue: radioString,
                                  onChanged: (RadioValues? value) {
                                    setState(() {
                                      radioString = value;
                                    });
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
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
                                  style: TextStyle(
                                    color: _colorScheme.inversePrimary,
                                  ),
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
                                padding: EdgeInsets.all(paddingStd),
                                child: Column(
                                  children: [
                                    // Text(
                                    //   "Button-Row: PRIMARY: foreground is primary. background as caption of button sasy.",
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "primary",
                                          nameOfBackgroundCol: "inversePrimary",
                                          foregroundCol: _colorScheme.primary,
                                          backgroundCol:
                                              _colorScheme.inversePrimary,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "primary",
                                          nameOfBackgroundCol: "null",
                                          foregroundCol: _colorScheme.primary,
                                          backgroundCol: null,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "primary",
                                          nameOfBackgroundCol:
                                              "primaryContainer",
                                          foregroundCol: _colorScheme.primary,
                                          backgroundCol:
                                              _colorScheme.primaryContainer,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "inversePrimary",
                                          nameOfBackgroundCol: "primary",
                                          foregroundCol:
                                              _colorScheme.inversePrimary,
                                          backgroundCol: _colorScheme.primary,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(paddingStd),
                                child: Column(
                                  children: [
                                    // Text("Button-Row: SECONDARY"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "secondary",
                                          nameOfBackgroundCol: "onSecondary",
                                          foregroundCol: _colorScheme.secondary,
                                          backgroundCol:
                                              _colorScheme.onSecondary,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "secondary",
                                          nameOfBackgroundCol: "null",
                                          foregroundCol: _colorScheme.secondary,
                                          backgroundCol: null,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "secondary",
                                          nameOfBackgroundCol:
                                              "secondaryContainer",
                                          foregroundCol: _colorScheme.secondary,
                                          backgroundCol:
                                              _colorScheme.secondaryContainer,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "onSecondary",
                                          nameOfBackgroundCol: "secondary",
                                          foregroundCol:
                                              _colorScheme.onSecondary,
                                          backgroundCol: _colorScheme.secondary,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(paddingStd),
                                child: Column(
                                  children: [
                                    Text("Button-Row: TERTIARY"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "tertiary",
                                          nameOfBackgroundCol: "onTertiary",
                                          foregroundCol: _colorScheme.tertiary,
                                          backgroundCol:
                                              _colorScheme.onTertiary,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "tertiary",
                                          nameOfBackgroundCol: "null",
                                          foregroundCol: _colorScheme.tertiary,
                                          backgroundCol: null,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "tertiary",
                                          nameOfBackgroundCol:
                                              "tertiaryContainer",
                                          foregroundCol: _colorScheme.tertiary,
                                          backgroundCol:
                                              _colorScheme.tertiaryContainer,
                                        ),
                                        ExampleButtonPlusDescription(
                                          nameOfTextCol: "onTertiary",
                                          nameOfBackgroundCol: "tertiary",
                                          foregroundCol:
                                              _colorScheme.onTertiary,
                                          backgroundCol: _colorScheme.tertiary,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(paddingStd * 2),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 600,
                                            height: 600,
                                            child: Container(
                                              color:
                                                  _colorScheme.primaryContainer,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                      paddingStd,
                                                    ),
                                                    child: Text(
                                                      style: TextStyle(
                                                        fontSize: textSizehuge,
                                                        color: _colorScheme
                                                            .primary,
                                                      ),
                                                      "An Article about Colors",
                                                    ),
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Text(
                                                    style: TextStyle(
                                                      fontSize: textSizeLarge,
                                                    ),
                                                    "abc def abc def abc def abc def abc def abc def ",
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(
                                                      paddingStd * 2,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ExampleButton(
                                                          caption: "Button Std",
                                                          foregroundCol:
                                                              _colorScheme
                                                                  .primary,
                                                          backgroundCol: null,
                                                        ),
                                                        ExampleButton(
                                                          caption: "Button Std",
                                                          foregroundCol:
                                                              _colorScheme
                                                                  .primary,
                                                          backgroundCol:
                                                              _colorScheme
                                                                  .surfaceContainerLowest,
                                                        ),
                                                        ExampleButton(
                                                          caption: "Button Std",
                                                          foregroundCol:
                                                              _colorScheme
                                                                  .inversePrimary,
                                                          backgroundCol:
                                                              _colorScheme
                                                                  .primary,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void applyChosenColor(Color chosenCol) {
    setState(() {
      _chosenColor = chosenCol;
    });
  }

  void useThisColorAsAColorRole() {
    // _ownCustomColorScheme = copiedScheme;

    switch (radioString) {
      case RadioValues.primary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          primary: _chosenColor,
        );
        break;
      case RadioValues.onPrimary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onPrimary: _chosenColor,
        );
        break;
      case RadioValues.inversePrimary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          inversePrimary: _chosenColor,
        );
        break;
      case RadioValues.primaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          primaryContainer: _chosenColor,
        );
        break;
      case RadioValues.onPrimaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onPrimaryContainer: _chosenColor,
        );
        break;
      case RadioValues.secondary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          secondary: _chosenColor,
        );
        break;
      case RadioValues.onSecondary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onSecondary: _chosenColor,
        );
        break;
      case RadioValues.secondaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          secondaryContainer: _chosenColor,
        );
        break;
      case RadioValues.onSecondaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onSecondaryContainer: _chosenColor,
        );
        break;
      case RadioValues.tertiary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          tertiary: _chosenColor,
        );
        break;
      case RadioValues.onTertiary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onTertiary: _chosenColor,
        );
        break;
      case RadioValues.tertiaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          tertiaryContainer: _chosenColor,
        );
        break;
      case RadioValues.onTertiaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onTertiaryContainer: _chosenColor,
        );
        break;
      case RadioValues.surface:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surface: _chosenColor,
        );
        break;
      case RadioValues.onSurface:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onSurface: _chosenColor,
        );
        break;
      case RadioValues.inverseSurface:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          inverseSurface: _chosenColor,
        );
        break;
      case RadioValues.surfaceBright:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surfaceBright: _chosenColor,
        );
        break;
      case RadioValues.surfaceContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surfaceContainer: _chosenColor,
        );
        break;
      case RadioValues.surfaceDim:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surfaceDim: _chosenColor,
        );
        break;
      case RadioValues.surfaceTint:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surfaceTint: _chosenColor,
        );
        break;
      case RadioValues.onSurfaceVariant:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onSurfaceVariant: _chosenColor,
        );
        break;
      case RadioValues.surfaceContainerLowest:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surfaceContainerLowest: _chosenColor,
        );
        break;
      case RadioValues.surfaceContainerLow:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surfaceContainerLow: _chosenColor,
        );
        break;
      case RadioValues.surfaceContainerHigh:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surfaceContainerHigh: _chosenColor,
        );
        break;
      case RadioValues.surfaceContainerHighest:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surfaceContainerHighest: _chosenColor,
        );
        break;
      case RadioValues.outline:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          outline: _chosenColor,
        );
        break;
      case RadioValues.outlineVariant:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          outlineVariant: _chosenColor,
        );
        break;
      case RadioValues.scrim:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          scrim: _chosenColor,
        );
        break;
      case RadioValues.shadow:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          shadow: _chosenColor,
        );
        break;

      default:
    }
  }

  void nowCreateAndUseTheme() {
    setState(() {
      _colorScheme = _ownCustomColorScheme;
    });
  }

  void useColorAsSeedColor() {
    setState(() {
      _colorScheme = ColorScheme.fromSeed(seedColor: _chosenColor);
      _ownCustomColorScheme = _colorScheme;
    });
  }

  void setColorSchemeGlobally(ThemeController themeController) {
    // ref.read(themeStateProvider.notifier).setColorTheme(_colorScheme);
    ref.read(themeStateProvider.notifier).setColorTheme(_colorScheme);
    // themeState.themeData;

    final String themeName = DateTime.now().toIso8601String();
    themeController.addThemeToList(
      themeName,
      ref.read(themeStateProvider).colorScheme,
      true,
    );
    themeController.applyTheme(themeName);
  }
}

class PanelDemo extends StatelessWidget {
  PanelDemo({super.key, required this.colScheme, required this.kindOfThemeCol});

  final ColorScheme colScheme;
  final String kindOfThemeCol;

  final String someFillText = "aaaaaaaaaaaaaaaaaaaaaaaa";

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
          width: 100,
          height: 100,
          child: Column(
            children: [
              Text(
                kindOfThemeCol,
                style: TextStyle(fontSize: textSizeLarge, color: mainCol),
              ),
              Text(someFillText, style: TextStyle(color: mainCol)),
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
              padding: EdgeInsets.all(paddingStd),
              child: SizedBox(
                width: 500,
                height: 260,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colScheme.outline),
                    color: low,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(paddingStd),
                    child: SizedBox(
                      width: 400,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: colScheme.outline),
                          color: high,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(paddingStd),
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
                                  fontSize: textSizehuge,
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
    return Column(
      children: [
        MiniColorBox(color: colScheme.primary, caption: "primary"),
        MiniColorBox(color: colScheme.onPrimary, caption: "onPrimary"),
        MiniColorBox(
          color: colScheme.inversePrimary,
          caption: "inversePrimary",
        ),
        MiniColorBox(
          color: colScheme.primaryContainer,
          caption: "primaryContainer",
        ),
        MiniColorBox(
          color: colScheme.onPrimaryContainer,
          caption: "onPrimaryContainer",
        ),
        // Divider(),
        MiniColorBox(color: colScheme.secondary, caption: "secondary"),
        MiniColorBox(color: colScheme.onSecondary, caption: "onSecondary"),
        MiniColorBox(
          color: colScheme.secondaryContainer,
          caption: "secondaryContainer",
        ),
        MiniColorBox(
          color: colScheme.onSecondaryContainer,
          caption: "onSecondaryContainer",
        ),
        // Divider(),
        MiniColorBox(color: colScheme.tertiary, caption: "tertiary"),
        MiniColorBox(color: colScheme.onTertiary, caption: "onTertiary"),
        MiniColorBox(
          color: colScheme.tertiaryContainer,
          caption: "tertiaryContainer",
        ),
        MiniColorBox(
          color: colScheme.onTertiaryContainer,
          caption: "onTertiaryContainer",
        ),
        // Divider(),
        MiniColorBox(color: colScheme.surface, caption: "surface"),
        MiniColorBox(
          color: colScheme.inverseSurface,
          caption: "inverseSurface",
        ),
        MiniColorBox(color: colScheme.surfaceBright, caption: "surfaceBright"),
        MiniColorBox(
          color: colScheme.surfaceContainer,
          caption: "surfaceContainer",
        ),
        MiniColorBox(color: colScheme.surfaceDim, caption: "surfaceDim"),
        MiniColorBox(color: colScheme.surfaceTint, caption: "surfaceTint"),
        MiniColorBox(color: colScheme.onSurface, caption: "onSurface"),
        MiniColorBox(
          color: colScheme.onSurfaceVariant,
          caption: "onSurfaceVariant",
        ),
        MiniColorBox(
          color: colScheme.surfaceContainerLowest,
          caption: "surfaceContainerLowest",
        ),
        MiniColorBox(
          color: colScheme.surfaceContainerLow,
          caption: "surfaceContainerLow",
        ),
        MiniColorBox(
          color: colScheme.surfaceContainerHigh,
          caption: "surfaceContainerHigh",
        ),
        MiniColorBox(
          color: colScheme.surfaceContainerHighest,
          caption: "surfaceContainerHighest",
        ),
        // Divider(),
        MiniColorBox(color: colScheme.outline, caption: "outline"),
        MiniColorBox(
          color: colScheme.outlineVariant,
          caption: "outlineVariant",
        ),
        MiniColorBox(color: colScheme.scrim, caption: "scrim"),
        MiniColorBox(color: colScheme.shadow, caption: "shadow"),
      ],
    );
  }
}

class MiniColorBox extends StatelessWidget {
  MiniColorBox({super.key, required this.color, required this.caption});

  final double width = 160;

  final double height = colorLineHeight - 2;
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
        // "Button on Container",
        caption,
        style: TextStyle(
          color: foregroundCol,
          // backgroundColor: backgroundCol,
        ),
      ),
    );
  }
}
