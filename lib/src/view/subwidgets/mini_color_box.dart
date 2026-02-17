import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/flutter_colortheme_creator.dart';
import 'package:flutter_colortheme_creator/src/provider/custom_color_scheme_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../guiConstants/gui_constants_for_package.dart';
import '../util/helpers.dart';

class MiniColorBox extends ConsumerStatefulWidget {
  MiniColorBox({
    super.key,
    required this.themeController,
    required this.color,
    required this.caption,
  });

  late final ThemeController themeController;
  final double width = 160;
  final double height = GuiConstantsForPackage.heightOfAColorLine - 2;
  final Color color;
  final String caption;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MiniColorBox();
  }
}

class _MiniColorBox extends ConsumerState<MiniColorBox> {
  late ColorScheme colorScheme;
  @override
  Widget build(Object context) {
    colorScheme = ref
        .watch(customColorSchemeDataProvider(widget.themeController))
        .customColorScheme;

    return Row(
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height,
          // child: Text(widget.caption, style: TextStyle(color: widget.color)),
          child: Text(
            widget.caption,
            style: TextStyle(color: colorScheme.primary),
          ),
        ),

        GestureDetector(
          onDoubleTap: () {
            Helpers.useThisColorAsPickerColor(
              ref,
              widget.themeController,
              widget.color,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
              border: Border.all(),
            ),
            child: SizedBox(width: widget.width, height: widget.height),
          ),
        ),
      ],
    );
  }
}
