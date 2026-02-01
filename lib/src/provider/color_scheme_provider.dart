import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_scheme_provider.g.dart';

@Riverpod(keepAlive: true)
class ColorSchemeSetter extends _$ColorSchemeSetter {
  @override
  ColorScheme build() {
    return ColorScheme.fromSeed(
        // seedColor: const Color.fromARGB(255, 129, 226, 44));
        seedColor: Colors.blue);
  }

  void setSeedColor(Color newSeedCol) {
    state = ColorScheme.fromSeed(seedColor: newSeedCol);
  }
}
