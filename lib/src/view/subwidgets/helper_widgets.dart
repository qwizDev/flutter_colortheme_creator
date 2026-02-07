import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gui_creation_helper/gui_creation_helper.dart';

const double colorPanelWidth = 600;
const double colorPanelHeigth = 1000;
const double singleColorWidth = 500;
const double singleColorHeigth = 40;

class ConstrainedColorBox extends ConstrainedBox {
  ConstrainedColorBox({
    super.key,
    this.col = Colors.green,
    this.givenColorCaption = "",
    required this.context,
    // }) : super.expand(
  }) : super(
         child: _createColorContainerWithCaptureText(
           col,
           givenColorCaption,
           context,
         ),
         //  width: _singleColorWidth,
         //  height: _singleColorHeigth,
         // height: 200,
         constraints: BoxConstraints(
           minWidth: 50,
           maxWidth: 1000,
           minHeight: 10,
           maxHeight: 80,
         ),
       );

  final Color col;
  final String givenColorCaption;
  final BuildContext context;

  /* could also be a factory constructor, but probably not worth the effort as
     it's a private method. */
  static Widget _createColorContainerWithCaptureText(
    Color color,
    String givenColorCaption,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2),
      child: Container(
        decoration: WidgetDeco.boxDecoStd,
        child: Container(
          color: color,
          child: Column(
            // children: [Text(givenColorCaption), Text(color.toString())],
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // color: Theme.of(context).colorScheme.surface,
                            color: Theme.of(context).colorScheme.inverseSurface,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    "Color:   $givenColorCaption",
                                    style: TextStyle(
                                      // color: Theme.of(context).colorScheme.onSurface,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onInverseSurface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(buildColorString(color)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String buildColorString(Color color) {
  const int nrOfDecimalPlaces = 3;
  String red = color.r.toStringAsFixed(nrOfDecimalPlaces).toString();
  String green = color.g.toStringAsFixed(nrOfDecimalPlaces).toString();
  String blue = color.b.toStringAsFixed(nrOfDecimalPlaces).toString();

  String result = "red: $red, green: $green, blue: $blue";
  return result;
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

Color buildRandomColor() {
  var rng = Random();
  int red = rng.nextInt(255);
  int green = rng.nextInt(255);
  int blue = rng.nextInt(255);
  return Color.fromRGBO(red, green, blue, 100);
}
