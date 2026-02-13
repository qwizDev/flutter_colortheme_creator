import 'package:flutter/material.dart';

import '../guiConstants/gui_constants_for_package.dart';

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
