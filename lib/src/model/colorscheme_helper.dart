import 'package:flutter/material.dart';

import 'colorscheme_key.dart';

class ColorSchemeHelper {
  static final Map<ColorSchemeKey, Color Function(ColorScheme)> _extractors = {
    ColorSchemeKey.primary: (s) => s.primary,
    ColorSchemeKey.onPrimary: (s) => s.onPrimary,
    ColorSchemeKey.primaryContainer: (s) => s.primaryContainer,
    ColorSchemeKey.onPrimaryContainer: (s) => s.onPrimaryContainer,

    ColorSchemeKey.secondary: (s) => s.secondary,
    ColorSchemeKey.onSecondary: (s) => s.onSecondary,
    ColorSchemeKey.secondaryContainer: (s) => s.secondaryContainer,
    ColorSchemeKey.onSecondaryContainer: (s) => s.onSecondaryContainer,

    ColorSchemeKey.tertiary: (s) => s.tertiary,
    ColorSchemeKey.onTertiary: (s) => s.onTertiary,
    ColorSchemeKey.tertiaryContainer: (s) => s.tertiaryContainer,
    ColorSchemeKey.onTertiaryContainer: (s) => s.onTertiaryContainer,

    ColorSchemeKey.error: (s) => s.error,
    ColorSchemeKey.onError: (s) => s.onError,
    ColorSchemeKey.errorContainer: (s) => s.errorContainer,
    ColorSchemeKey.onErrorContainer: (s) => s.onErrorContainer,

    ColorSchemeKey.background: (s) => s.background,
    ColorSchemeKey.onBackground: (s) => s.onBackground,

    ColorSchemeKey.surface: (s) => s.surface,
    ColorSchemeKey.onSurface: (s) => s.onSurface,
    ColorSchemeKey.surfaceVariant: (s) => s.surfaceVariant,
    ColorSchemeKey.onSurfaceVariant: (s) => s.onSurfaceVariant,

    ColorSchemeKey.outline: (s) => s.outline,
    ColorSchemeKey.outlineVariant: (s) => s.outlineVariant,

    ColorSchemeKey.shadow: (s) => s.shadow,
    ColorSchemeKey.scrim: (s) => s.scrim,

    ColorSchemeKey.inverseSurface: (s) => s.inverseSurface,
    ColorSchemeKey.onInverseSurface: (s) => s.onInverseSurface,
    ColorSchemeKey.inversePrimary: (s) => s.inversePrimary,
  };

  /// Gibt alle Farben als Liste zurück
  static List<Color> toList(ColorScheme scheme) =>
      _extractors.values.map((fn) => fn(scheme)).toList();

  /// Gibt alle Farben mit semantischem Key zurück
  static Map<ColorSchemeKey, Color> toMap(ColorScheme scheme) =>
      _extractors.map((k, fn) => MapEntry(k, fn(scheme)));
}
