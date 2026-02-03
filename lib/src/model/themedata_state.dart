import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'themedata_state.freezed.dart';

@freezed
class ThemeDataState with _$ThemeDataState {
  @override
  final Color seedColor;
  @override
  final ColorScheme colorScheme;
  @override
  final ThemeData themeData;

  ThemeDataState({
    required this.seedColor,
    required this.colorScheme,
    required this.themeData,
  });
}
