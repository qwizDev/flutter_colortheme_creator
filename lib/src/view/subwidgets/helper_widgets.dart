import 'dart:math';

import 'package:flutter/material.dart';

const double colorPanelWidth = 600;
const double colorPanelHeigth = 1000;
const double singleColorWidth = 500;
const double singleColorHeigth = 40;

class ConstrainedColorBox extends ConstrainedBox {
  ConstrainedColorBox({
    super.key,
    this.col = Colors.green,
    this.givenColorCaption = "",
    // }) : super.expand(
  }) : super(
         child: _createColorContainerWithCaptureText(col, givenColorCaption),
         //  width: _singleColorWidth,
         //  height: _singleColorHeigth,
         // height: 200,
         constraints: BoxConstraints(
           minWidth: 50,
           maxWidth: 1000,
           minHeight: 10,
           maxHeight: 60,
         ),
       );

  final Color col;
  final String givenColorCaption;

  /* could also be a factory constructor, but probably not worth the effort as
     it's a private method. */
  static Widget _createColorContainerWithCaptureText(
    Color color,
    String givenColorCaption,
  ) {
    return Container(
      color: color,
      child: Column(
        children: [Text(givenColorCaption), Text(color.toString())],
      ),
    );
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

Color buildRandomColor() {
  var rng = Random();
  int red = rng.nextInt(255);
  int green = rng.nextInt(255);
  int blue = rng.nextInt(255);
  return Color.fromRGBO(red, green, blue, 100);
}
