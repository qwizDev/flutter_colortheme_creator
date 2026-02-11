import 'package:gui_creation_helper/gui_creation_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'radio_value_for_color_role.g.dart';

@Riverpod(keepAlive: true)
class RadioValueForColorRole extends _$RadioValueForColorRole {
  static const ColorSchemeKey _std = ColorSchemeKey.primary;

  @override
  ColorSchemeKey build() {
    return _std;
  }

  void setValue(ColorSchemeKey? value) {
    state = value ?? _std;
  }
}
