import 'package:flutter/material.dart';
import 'package:flutter_colortheme_creator/src/provider/radio_value_for_color_role.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../flutter_colortheme_creator.dart';
import '../../provider/custom_colorscheme_data_provider.dart';
import '../../provider/theme_state_provider.dart';

class ColorPickerAndButtonsWidget extends ConsumerStatefulWidget {
  const ColorPickerAndButtonsWidget({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ColorPickerAndButtonsWidget();
  }
}

class _ColorPickerAndButtonsWidget
    extends ConsumerState<ColorPickerAndButtonsWidget> {
  final buttonSizeMax = WidgetStateProperty.all(const Size(250, 250));
  final buttonSizeMin = WidgetStateProperty.all(const Size(250, 50));
  // late ColorschemeData _customColorSchemeData;
  late ColorScheme _ownCustomColorScheme;
  late ColorSchemeKey _radioColorKey;
  late final ThemeController themeController = widget.themeController;

  @override
  Widget build(BuildContext context) {
    final customColorSchemeData = ref.watch(
      customColorschemeDataProvider(themeController),
    );

    _ownCustomColorScheme = customColorSchemeData.customColorScheme;
    final chosenColor = customColorSchemeData.chosenColor;

    _radioColorKey = ref.watch(radioValueForColorRoleProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: WidgetDeco.boxDecoStd,
          child: ColorPicker(
            pickerColor: chosenColor,
            onColorChanged: (color) => applyChosenColor(themeController, color),
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
                      onPressed: () => useThisColorAsAColorRole(),
                      child: Text("USE THIS COLOR"),
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
                      onPressed: () => nowCreateAndUseTheme(themeController),
                      child: Text("CREATE AND USE THEME"),
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
                      onPressed: () => useColorAsSeedColor(themeController),
                      child: Text("USE AS SEED COLOR"),
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
                      onPressed: () {
                        setColorSchemeGlobally(themeController);
                      },
                      child: Text("USE SCHEME GLOBALLY"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void applyChosenColor(ThemeController themeController, Color chosenCol) {
    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setChosenColor(chosenCol);
  }

  void useThisColorAsAColorRole() {
    final chosenColor = ref
        .read(customColorschemeDataProvider(themeController))
        .chosenColor;

    switch (_radioColorKey) {
      case ColorSchemeKey.primary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          primary: chosenColor,
        );
        break;
      case ColorSchemeKey.onPrimary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onPrimary: chosenColor,
        );
        break;
      case ColorSchemeKey.inversePrimary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          inversePrimary: chosenColor,
        );
        break;
      case ColorSchemeKey.primaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          primaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.onPrimaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onPrimaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.secondary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          secondary: chosenColor,
        );
        break;
      case ColorSchemeKey.onSecondary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onSecondary: chosenColor,
        );
        break;
      case ColorSchemeKey.secondaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          secondaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.onSecondaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onSecondaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.tertiary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          tertiary: chosenColor,
        );
        break;
      case ColorSchemeKey.onTertiary:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onTertiary: chosenColor,
        );
        break;
      case ColorSchemeKey.tertiaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          tertiaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.onTertiaryContainer:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onTertiaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.surface:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          surface: chosenColor,
        );
        break;
      case ColorSchemeKey.onSurface:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          onSurface: chosenColor,
        );
        break;
      case ColorSchemeKey.inverseSurface:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          inverseSurface: chosenColor,
        );
        break;
      // case ColorSchemeKey.surfaceBright:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     surfaceBright: chosenColor,
      //   );
      //   break;
      // case ColorSchemeKey.surfaceContainer:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     surfaceContainer: chosenColor,
      //   );
      //   break;
      // case ColorSchemeKey.surfaceDim:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     surfaceDim: chosenColor,
      //   );
      //   break;
      // case ColorSchemeKey.surfaceTint:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     surfaceTint: chosenColor,
      //   );
      //   break;
      // case ColorSchemeKey.onSurfaceVariant:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     onSurfaceVariant: chosenColor,
      //   );
      //   break;
      // case ColorSchemeKey.surfaceContainerLowest:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     surfaceContainerLowest: chosenColor,
      //   );
      //   break;
      // case ColorSchemeKey.surfaceContainerLow:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     surfaceContainerLow: chosenColor,
      //   );
      //   break;
      // case ColorSchemeKey.surfaceContainerHigh:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     surfaceContainerHigh: chosenColor,
      //   );
      //   break;
      // case ColorSchemeKey.surfaceContainerHighest:
      //   _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
      //     surfaceContainerHighest: chosenColor,
      //   );
      //   break;
      case ColorSchemeKey.outline:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          outline: chosenColor,
        );
        break;
      case ColorSchemeKey.outlineVariant:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          outlineVariant: chosenColor,
        );
        break;
      case ColorSchemeKey.scrim:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          scrim: chosenColor,
        );
        break;
      case ColorSchemeKey.shadow:
        _ownCustomColorScheme = _ownCustomColorScheme.copyWith(
          shadow: chosenColor,
        );
        break;

      default:
    }

    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setCustomColorScheme(_ownCustomColorScheme);
  }

  void nowCreateAndUseTheme(ThemeController themeController) {
    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setCustomColorScheme(_ownCustomColorScheme);
  }

  void useColorAsSeedColor(ThemeController themeController) {
    _ownCustomColorScheme = ColorScheme.fromSeed(
      seedColor: ref
          .read(customColorschemeDataProvider(themeController))
          .chosenColor,
    );
    ref
        .read(customColorschemeDataProvider(themeController).notifier)
        .setCustomColorScheme(_ownCustomColorScheme);
  }

  void setColorSchemeGlobally(ThemeController themeController) {
    ref
        .read(themeStateProvider.notifier)
        .setColorTheme(
          ref
              .read(customColorschemeDataProvider(themeController))
              .customColorScheme,
        );

    final String themeName = DateTime.now().toIso8601String();
    themeController.addThemeToList(
      themeName,
      ref.read(themeStateProvider).colorScheme,
      true,
    );
    themeController.applyTheme(themeName);
  }
}
