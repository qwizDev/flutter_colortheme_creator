import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_scheme_data.freezed.dart';

@freezed
class ColorSchemeData with _$ColorSchemeData {
  @override
  final ColorScheme customColorScheme;
  @override
  final Color chosenColor;

  ColorSchemeData({required this.customColorScheme, required this.chosenColor});
}
