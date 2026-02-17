import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gui_creation_helper/gui_creation_helper.dart';

import '../../../flutter_colortheme_creator.dart';
import '../../model/color_scheme_data.dart';
import '../../provider/custom_color_scheme_data_provider.dart';
import '../../provider/radio_value_for_color_role.dart';

enum AppliedColorScheme { appWide, ownCustom }

class Helpers {
  static void applyChosenColor(
    WidgetRef ref,
    ThemeController themeController,
    Color chosenCol,
  ) {
    ref
        .read(customColorSchemeDataProvider(themeController).notifier)
        .setChosenColor(chosenCol);
  }

  static void useThisColorAsAColorRole(
    WidgetRef ref,
    ThemeController themeController,
  ) {
    ColorScheme ownCustomColorScheme = ref
        .read(customColorSchemeDataProvider(themeController))
        .customColorScheme;

    final Color chosenColor = ref
        .read(customColorSchemeDataProvider(themeController))
        .chosenColor;

    final ColorSchemeKey radioColorKey = ref.read(
      radioValueForColorRoleProvider,
    );

    switch (radioColorKey) {
      case ColorSchemeKey.primary:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          primary: chosenColor,
        );
        break;
      case ColorSchemeKey.onPrimary:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          onPrimary: chosenColor,
        );
        break;
      case ColorSchemeKey.inversePrimary:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          inversePrimary: chosenColor,
        );
        break;
      case ColorSchemeKey.primaryContainer:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          primaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.onPrimaryContainer:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          onPrimaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.secondary:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          secondary: chosenColor,
        );
        break;
      case ColorSchemeKey.onSecondary:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          onSecondary: chosenColor,
        );
        break;
      case ColorSchemeKey.secondaryContainer:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          secondaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.onSecondaryContainer:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          onSecondaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.tertiary:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          tertiary: chosenColor,
        );
        break;
      case ColorSchemeKey.onTertiary:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          onTertiary: chosenColor,
        );
        break;
      case ColorSchemeKey.tertiaryContainer:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          tertiaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.onTertiaryContainer:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          onTertiaryContainer: chosenColor,
        );
        break;
      case ColorSchemeKey.surface:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          surface: chosenColor,
        );
        break;
      case ColorSchemeKey.onSurface:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          onSurface: chosenColor,
        );
        break;
      case ColorSchemeKey.inverseSurface:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
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
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          outline: chosenColor,
        );
        break;
      case ColorSchemeKey.outlineVariant:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          outlineVariant: chosenColor,
        );
        break;
      case ColorSchemeKey.scrim:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          scrim: chosenColor,
        );
        break;
      case ColorSchemeKey.shadow:
        ownCustomColorScheme = ownCustomColorScheme.copyWith(
          shadow: chosenColor,
        );
        break;

      default:
    }

    ref
        .read(customColorSchemeDataProvider(themeController).notifier)
        .setCustomColorScheme(ownCustomColorScheme);
  }

  static void useColorSchemeKeyForPickerColor(
    WidgetRef ref,
    ThemeController themeController,
    ColorSchemeKey radVal,
  ) {
    final Map<ColorSchemeKey, Color> colorSchemeAsMap = ColorSchemeHelper.toMap(
      ref
          .read(customColorSchemeDataProvider(themeController))
          .customColorScheme,
    );

    final colorToSet = colorSchemeAsMap[radVal] ?? Colors.amber;

    ref
        .read(customColorSchemeDataProvider(themeController).notifier)
        .setChosenColor(colorToSet);
  }

  static void useThisColorAsPickerColor(
    WidgetRef ref,
    ThemeController themeController,
    Color color,
  ) {
    ref
        .read(customColorSchemeDataProvider(themeController).notifier)
        .setChosenColor(color);
  }

  // static String colorToHex(Color color) {
  //   // return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  //   return '#${color.toARGB32().toRadixString(16).padLeft(24, '0').toUpperCase()}';
  // }
}
