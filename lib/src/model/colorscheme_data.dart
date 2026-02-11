import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'colorscheme_data.freezed.dart';

@freezed
class ColorschemeData with _$ColorschemeData {
  @override
  final ColorScheme customColorScheme;
  @override
  final Color chosenColor;

  ColorschemeData({required this.customColorScheme, required this.chosenColor});
}
