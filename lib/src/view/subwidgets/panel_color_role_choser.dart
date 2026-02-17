import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/flutter_colortheme_creator.dart';
import 'package:flutter_colortheme_creator/src/provider/custom_color_scheme_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../provider/radio_value_for_color_role.dart';
import '../util/helpers.dart';

class PanelColorRoleChoser extends ConsumerStatefulWidget {
  const PanelColorRoleChoser({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PanelColorRoleChoser();
  }
}

class _PanelColorRoleChoser extends ConsumerState<PanelColorRoleChoser> {
  late ThemeController themeController;
  late ColorSchemeKey _radioColorKey;
  late ColorScheme _colorScheme;

  @override
  Widget build(BuildContext context) {
    themeController = widget.themeController;
    _colorScheme = ref
        .watch(customColorSchemeDataProvider(themeController))
        .customColorScheme;
    _radioColorKey = ref.watch(radioValueForColorRoleProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 1000, maxWidth: 300),

          // height: 600,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Color to set up",
                  style: TextStyle(color: _colorScheme.primary),
                ),
                for (ColorSchemeKey radVal in ColorSchemeKey.values)
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
                        Helpers.useColorSchemeKeyForPickerColor(
                          ref,
                          widget.themeController,
                          radVal,
                        );
                      },
                      child: Text(
                        radVal.name,
                        style: TextStyle(color: _colorScheme.primary),
                      ),
                    ),
                    leading: Radio<ColorSchemeKey>(
                      value: radVal,
                      fillColor: WidgetStatePropertyAll(_colorScheme.primary),
                      groupValue: _radioColorKey,
                      onChanged: (ColorSchemeKey? value) {
                        ref
                            .read(radioValueForColorRoleProvider.notifier)
                            .setValue(value);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
