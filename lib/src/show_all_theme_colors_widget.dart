import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';
// import 'package:sp_frontend/apps/sp/gui/screens/setStartConfig/subwidgets/nice_text.dart';
// import 'package:sp_frontend/apps/sp/gui/util/gui_constants.dart';

final double _colorPanelWidth = 600;
final double _colorPanelHeigth = 1000;
final double _singleColorWidth = 500;
final double _singleColorHeigth = 40;

final Color _startColor = Colors.red;

// final Color _colBorderStd = const Color.fromARGB(255, 1, 20, 52);
// // final Color _colBorderLighter = const Color.fromARGB(43, 1, 20, 52);
// final Color colBoxBorderStd = _colBorderStd;
// final Color colMenuSeperationBorder = _colBorderLighter;


class ShowAllThemeColorsWidget extends StatefulWidget {
  const ShowAllThemeColorsWidget({super.key, this.title = "noTitleGiven"});
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ContentWidgetThemeColor();
  }

    // void printThemeDataStuff(BuildContext context) {
  //   ThemeData stuff = Theme.of(context);
  //   for (var elem in stuff.colorScheme) {
  //     print(elem.toString());
  //   }
  // }

}

class _ContentWidgetThemeColor extends State<StatefulWidget> {
  _ContentWidgetThemeColor();

  Color _chosenColor = _startColor;

  late ColorScheme _customScheme;

  late ThemeData _customThemeData;

  @override
  Widget build(BuildContext context) {
    _customScheme = ColorScheme.fromSeed(seedColor: _chosenColor);

    _customThemeData = ThemeData(
      colorScheme: _customScheme,
      useMaterial3: true,
    );

    final int redPartOfColor = _chosenColor.red;
    final int greenPartOfColor = _chosenColor.green;
    final int bluePartOfColor = _chosenColor.blue;

    final String _chosenColorString =
        "RED: $redPartOfColor, GREEN: $greenPartOfColor, BLUE: $bluePartOfColor";

    return Center(
      child: Container(
        decoration: boxDecoStd,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // NiceText("Colors of theme being in use"),
              Text("Colors of theme being in use"),
              SizedBox(
                  width: _colorPanelWidth,
                  height: _colorPanelHeigth,
                  child: Column(children: [
                    SizedColorBox(
                      col: Theme.of(context).primaryColor,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).primaryColorDark,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).primaryColorLight,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).colorScheme.primary,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).colorScheme.secondary,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).colorScheme.primary,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).colorScheme.tertiary,
                    ),
                    SizedColorBox(
                      col: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                  ])),
              Divider(),
              ColButtonBox(
                onPressed: () => setRandom_second(updateColors),
                caption: "use a random color",
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: NiceText("Colors for currently chosen color:"),
                child: Text("Colors for currently chosen color:"),
              ),
              // NiceText(_chosenColorString),
              Text(_chosenColorString),
              Text(_chosenColor.toString()),
              // NiceText(_chosenColor.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: _colorPanelWidth,
                      height: _colorPanelHeigth,
                      child: Column(children: [
                        SizedColorBox(
                          col: _customThemeData.primaryColor,
                          givenColorCaption: "primaryColor",
                        ),
                        SizedColorBox(
                          col: _customThemeData.primaryColorDark,
                          givenColorCaption: "primaryColorDark",
                        ),
                        SizedColorBox(
                          col: _customThemeData.primaryColorLight,
                          givenColorCaption: "primaryColorLight",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.primary,
                          givenColorCaption: "colorScheme.colorScheme.primary",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.onPrimary,
                          givenColorCaption:
                              "colorScheme.colorScheme.onPrimary",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.primaryContainer,
                          givenColorCaption:
                              "colorScheme.colorScheme.primaryContainer",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.surface,
                          givenColorCaption: "colorScheme.colorScheme.surface",
                        ),
                        SizedColorBox(
                          col: _customThemeData
                              .colorScheme.surfaceContainerLowest,
                          givenColorCaption:
                              "colorScheme.colorScheme.surfaceContainerLowest",
                        ),
                        SizedColorBox(
                          col: _customThemeData
                              .colorScheme.surfaceContainerHighest,
                          givenColorCaption:
                              "colorScheme.colorScheme.surfaceContainerHighest",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.secondary,
                          givenColorCaption: "colorScheme.secondary",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.onSecondary,
                          givenColorCaption: "colorScheme.onSecondary",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.secondaryContainer,
                          givenColorCaption: "colorScheme.secondaryContainer",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.tertiary,
                          givenColorCaption: "colorScheme.tertiary",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.onTertiary,
                          givenColorCaption: "colorScheme.onTertiary",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.tertiaryContainer,
                          givenColorCaption: "colorScheme.tertiaryContainer",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.inversePrimary,
                          givenColorCaption: "colorScheme.inversePrimary",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.inverseSurface,
                          givenColorCaption: "colorScheme.inverseSurface",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.outline,
                          givenColorCaption: "colorScheme.outline",
                        ),
                        SizedColorBox(
                          col: _customThemeData.colorScheme.scrim,
                          givenColorCaption: "colorScheme.scrim",
                        ),
                        SizedColorBox(
                          col: _customThemeData
                              .colorScheme.surfaceContainerHighest,
                          givenColorCaption:
                              "colorScheme.surfaceContainerHighest",
                        ),
                        SizedColorBox(
                          col: _customThemeData
                              .colorScheme.surfaceContainerLowest,
                          givenColorCaption:
                              "colorScheme.surfaceContainerLowest",
                        ),
                      ])),
                  SizedBox(
                      width: _colorPanelWidth,
                      height: _colorPanelHeigth,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: _customThemeData.colorScheme.outline,
                                width: 2),
                            // color: _customThemeData.colorScheme.surface),
                            color: _customThemeData.colorScheme.surface),
                        child: Column(children: [
                          Text(
                            "This is an Example Widget for showing current colors",
                          ),
                          Text(
                            "The background-color is surface",
                          ),
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
                                        .colorScheme.onSecondary,
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
                          )
                        ]),
                      )),
                ],
              ),
              Divider(),
              ConfigureColorsPanel(
                updateColorAndStateCallback: updateColors,
                getColorCallback: getCurrentColor,
                currentColor: _chosenColor,
                colThemeData: _customThemeData,
              ),
            ],
          ),
        ),
      ),
    );
  }

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
    setState(() {
      _chosenColor = newColor;
    });
  }

  Color getCurrentColor() {
    return _chosenColor;
  }
}

// ignore: must_be_immutable
class SizedColorBox extends SizedBox {
  SizedColorBox({super.key, this.col = Colors.green, this.givenColorCaption = ""
      // }) : super.expand(
      })
      : super(
            child: _createColorContainerWithCaptureText(col, givenColorCaption),
            width: _singleColorWidth,
            height: _singleColorHeigth);

  Color col;
  String givenColorCaption;

  /* could also be a factory constructor, but probably not worth the effort as
     it's a private method. */
  static Widget _createColorContainerWithCaptureText(
      Color color, String givenColorCaption) {
    return Container(
        color: color,
        child: Column(
          children: [
            Text(givenColorCaption),
            Text(color.toString()),
          ],
        ));
  }
}

class ConfigureColorsPanel extends StatelessWidget {
  const ConfigureColorsPanel(
      {super.key,
      required this.updateColorAndStateCallback,
      required this.getColorCallback,
      required this.currentColor,
      required this.colThemeData});

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
        Text("Configuring colors"),

        // NiceText("Configuring colors"),
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
                  decoration: boxDecoStd,
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
              child: Text("ExampleWidget for PrimaryColor:"),
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

  ColButtonBox(
      {super.key, required String caption, required void Function()? onPressed})
      : super(
            height: 40,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ColButton(
                caption: caption,
                onPressed: onPressed,
              ),
            ));
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
    constraints: BoxConstraints(
      maxHeight: 800,
      maxWidth: 600,
    ),
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
                    "Text has color: primaryColorLight"),
                Text(
                    style: TextStyle(color: colThemeData.primaryColorDark),
                    "Text has color: primaryColorDark"),
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
                    "Text has color: primaryColor"),
                Text(
                    style: TextStyle(color: colThemeData.primaryColorDark),
                    "Text has color: primaryColorDark"),
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
                    "Text has color: primaryColor"),
                Text(
                    style: TextStyle(color: colThemeData.primaryColorLight),
                    "Text has color: primaryColorLight"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// _customThemeData.primaryColor
// _customThemeData.primaryColorDark
// _customThemeData.primaryColorLight
// _customThemeData.secondaryHeaderColor
// _customThemeData.colorScheme.primary
// _customThemeData.colorScheme.tertiary
// _customThemeData.colorScheme.tertiaryContainer
  