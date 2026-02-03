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

  Color col;
  String givenColorCaption;

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
