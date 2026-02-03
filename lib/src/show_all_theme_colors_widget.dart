import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colortheme_creator/src/provider/color_scheme_manager_provider.dart';
import 'package:flutter_colortheme_creator/src/subwidgets/widget_currently_chosen_color.dart';
import 'package:flutter_colortheme_creator/src/subwidgets/widget_themecolors_in_use.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';
// import 'package:sp_frontend/apps/sp/gui/screens/setStartConfig/subwidgets/nice_text.dart';
// import 'package:sp_frontend/apps/sp/gui/util/gui_constants.dart';



// final Color _colBorderStd = const Color.fromARGB(255, 1, 20, 52);
// // final Color _colBorderLighter = const Color.fromARGB(43, 1, 20, 52);
// final Color colBoxBorderStd = _colBorderStd;
// final Color colMenuSeperationBorder = _colBorderLighter;

class ShowAllThemeColorsWidget extends ConsumerStatefulWidget {
  const ShowAllThemeColorsWidget({super.key, this.title = "noTitleGiven"});
  final String title;
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ContentWidgetThemeColor();
  }

  // void printThemeDataStuff(BuildContext context) {
  //   ThemeData stuff = Theme.of(context);
  //   for (var elem in stuff.colorScheme) {
  //     print(elem.toString());
  //   }
  // }
}

class _ContentWidgetThemeColor extends ConsumerState<ConsumerStatefulWidget> {
  _ContentWidgetThemeColor();

  late final Color _chosenColor;
  late final colorSchemeManager;

  // late ColorScheme _customScheme;

  late final ThemeData _customThemeData;

  @override
  Widget build(BuildContext context) {

  colorSchemeManager = ref.watch(colorSchemeManagerProvider.notifier);

  _chosenColor = colorSchemeManager.getSeedColor();

    // _customScheme = ColorScheme.fromSeed(seedColor: _chosenColor);

    // _customThemeData = ThemeData(
    //   // colorScheme: _customScheme,
    //   colorScheme: ref.read(colorSchemeManagerProvider),
    //   useMaterial3: true,
    // );
  _customThemeData = colorSchemeManager.createThemeDataFromColorScheme();

    // final int redPartOfColor = _chosenColor.red;
    // final int greenPartOfColor = _chosenColor.green;
    // final int bluePartOfColor = _chosenColor.blue;

    // final String _chosenColorString =
    //     "RED: $redPartOfColor, GREEN: $greenPartOfColor, BLUE: $bluePartOfColor";

    return Center(
      child: Container(
        decoration: WidgetDeco.boxDecoStd,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DisplayWidgetThemeColorsInUse(),
              Divider(),
              ColButtonBox(
                onPressed: () => setRandom_second(updateColors),
                caption: "use a random color",
              ),
              // Divider(),
                DisplayWidgetForCurrentlyChosenColor(),
                  // SizedBox(
                  //   width: _colorPanelWidth,
                  //   height: _colorPanelHeigth,
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: 1000,
                      minWidth: 100,
                      maxWidth: 1000,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _customThemeData.colorScheme.outline,
                          width: 2,
                        ),
                        // color: _customThemeData.colorScheme.surface),
                        color: _customThemeData.colorScheme.surface,
                      ),
                      child: Column(
                        children: [
                          /* ---------------------------------------------------------------- */
                          Text(
                            "This is an Example Widget for showing current colors",
                          ),
                          /* ---------------------------------------------------------------- */
                          Text("The background-color is surface"),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: emptyFunc,
                                child: Text(
                                  "primary",
                                  style: TextStyle(
                                    backgroundColor:
                                        _customThemeData.colorScheme.primary,
                                    color:
                                        _customThemeData.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: emptyFunc,
                                child: Text(
                                  "secondary",
                                  style: TextStyle(
                                    backgroundColor:
                                        _customThemeData.colorScheme.secondary,
                                    color: _customThemeData
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: emptyFunc,
                                child: Text(
                                  "tertiary",
                                  style: TextStyle(
                                    backgroundColor:
                                        _customThemeData.colorScheme.tertiary,
                                    color:
                                        _customThemeData.colorScheme.onTertiary,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: emptyFunc,
                                child: Text(
                                  "primary",
                                  style: TextStyle(
                                    color: _customThemeData.colorScheme.primary,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: emptyFunc,
                                child: Text(
                                  "secondary",
                                  style: TextStyle(
                                    color:
                                        _customThemeData.colorScheme.secondary,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: emptyFunc,
                                child: Text(
                                  "tertiary",
                                  style: TextStyle(
                                    color:
                                        _customThemeData.colorScheme.tertiary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                
              ),
              Divider(),
              ConfigureColorsPanel(
                updateColorAndStateCallback: updateColors,
                getColorCallback: getCurrentColor,
                currentColor: _chosenColor,
                colThemeData: _customThemeData,
              ),
          ],  //children of column
        ),  //Colums        
          ), //SingleChildScrollView 
        ), //Container      
    );
  } //build-method

  var emptyFunc = () {};

  void setNewColor_second(Function func, Color newColor) {
    func(newColor);
  }

  void setRandom_second(Function func) {
    var rng = Random();
    int red = rng.nextInt(255);
    int green = rng.nextInt(255);
    int blue = rng.nextInt(255);

    Color newColor = Color.fromRGBO(red, green, blue, 100);

    setNewColor_second(func, newColor);
  }
  // manuallyChosenColor

  void updateColors(Color newColor) {
    // setState(() {
    //   chosenColor = newColor;
    // });
    ref.read(colorSchemeManagerProvider.notifier).setSeedColor(newColor);
  }

  Color getCurrentColor() {
    return _chosenColor;
  }
}


class ConfigureColorsPanel extends StatelessWidget {
  const ConfigureColorsPanel({
    super.key,
    required this.updateColorAndStateCallback,
    required this.getColorCallback,
    required this.currentColor,
    required this.colThemeData,
  });

  /* did not use a provider to learn how to do 
     it the setState callback-passing way */
  final Function updateColorAndStateCallback;
  final Function getColorCallback;
  final Color currentColor;
  final ThemeData colThemeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* ---------------------------------------------------------------- */
        Text("Configuring colors"),

        /* ---------------------------------------------------------------- */
        Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("current color: "),
            // ),
            ColButtonBox(
              onPressed: null,
              caption: "Use as seed for App-Theme (NYI)",
            ),
            // Divider(),
            // ColButtonBox(
            //   onPressed: () => showColorPicker(),
            //   caption: "show color picker",
            // ),
            Row(
              children: [
                Expanded(child: SizedBox(height: 10)),
                Container(
                  decoration: WidgetDeco.boxDecoStd,
                  child: ColorPicker(
                    pickerColor: currentColor,
                    // print("prints from onColorChanged. Color:\t $color")),
                    onColorChanged: (color) => setNewColor(color),
                  ),
                ),
                Expanded(child: SizedBox(height: 10)),
              ],
            ),
            ColButtonBox(
              onPressed: () => setRandom(),
              caption: "use a random color",
            ),
            ColButtonBox(
              onPressed: () => setNewColor(Colors.yellow),
              caption: "use yellow",
            ),
            ColButtonBox(
              onPressed: () {},
              caption: "Save SeedColor SOMEHOW (NYI)",
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              /* ---------------------------------------------------------------- */
              child: Text("ExampleWidget for PrimaryColor:"),
              /* ---------------------------------------------------------------- */
            ),
            getExampleWidgetForChosenColors(colThemeData),
            Text("ExampleWidget for SecondaryColor:"),
          ],
        ),
      ],
    );
  }

  void showColorPicker() {}

  void setNewColor(Color newColor) {
    updateColorAndStateCallback(newColor);
  }

  void setRandom() {
    var rng = Random();
    int red = rng.nextInt(255);
    int green = rng.nextInt(255);
    int blue = rng.nextInt(255);

    Color newColor = Color.fromRGBO(red, green, blue, 100);

    setNewColor(newColor);
  }
}

class ColButtonBox extends SizedBox {
  // final double ownWidth = 300;
  // final double ownHeight = 300;

  ColButtonBox({
    super.key,
    required String caption,
    required void Function()? onPressed,
  }) : super(
         height: 40,
         width: 300,
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: ColButton(caption: caption, onPressed: onPressed),
         ),
       );
}

class ColButton extends ElevatedButton {
  ColButton({super.key, required super.onPressed, required String caption})
    : super(child: Text(caption));
}

Widget getExampleWidgetForChosenColors(ThemeData colThemeData) {
  // return SizedBox(
  //   width: 400,
  //   height: 800,
  return ConstrainedBox(
    constraints: BoxConstraints(maxHeight: 800, maxWidth: 600),
    child: Column(
      children: [
        SizedBox(
          // height: 40,
          width: 400,
          // height: 400,
          child: Container(
            color: colThemeData.primaryColor,
            child: Column(
              children: [
                Text("BackgroundColor: primaryColor"),
                Text("Text has color: default"),
                Text(
                  style: TextStyle(color: colThemeData.primaryColorLight),
                  "Text has color: primaryColorLight",
                ),
                Text(
                  style: TextStyle(color: colThemeData.primaryColorDark),
                  "Text has color: primaryColorDark",
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          // height: 40,
          width: 400,
          child: Container(
            color: colThemeData.primaryColorLight,
            child: Column(
              children: [
                Text("BackgroundColor: primaryColorLight"),
                Text("Text has color: default"),
                Text(
                  style: TextStyle(color: colThemeData.primaryColor),
                  "Text has color: primaryColor",
                ),
                Text(
                  style: TextStyle(color: colThemeData.primaryColorDark),
                  "Text has color: primaryColorDark",
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          // height: 40,
          width: 400,
          child: Container(
            color: colThemeData.primaryColorDark,
            child: Column(
              children: [
                Text("BackgroundColor: primaryColorDark"),
                Text("Text has color: default"),
                Text(
                  style: TextStyle(color: colThemeData.primaryColor),
                  "Text has color: primaryColor",
                ),
                Text(
                  style: TextStyle(color: colThemeData.primaryColorLight),
                  "Text has color: primaryColorLight",
                ),
              ],
            ),
          ),
        ),
      ],),
    );
  
}

// _customThemeData.primaryColor
// _customThemeData.primaryColorDark
// _customThemeData.primaryColorLight
// _customThemeData.secondaryHeaderColor
// _customThemeData.colorScheme.primary
// _customThemeData.colorScheme.tertiary
// _customThemeData.colorScheme.tertiaryContainer
