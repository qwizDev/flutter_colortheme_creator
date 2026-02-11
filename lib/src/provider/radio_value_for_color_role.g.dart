// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_value_for_color_role.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RadioValueForColorRole)
final radioValueForColorRoleProvider = RadioValueForColorRoleProvider._();

final class RadioValueForColorRoleProvider
    extends $NotifierProvider<RadioValueForColorRole, ColorSchemeKey> {
  RadioValueForColorRoleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'radioValueForColorRoleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$radioValueForColorRoleHash();

  @$internal
  @override
  RadioValueForColorRole create() => RadioValueForColorRole();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorSchemeKey value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorSchemeKey>(value),
    );
  }
}

String _$radioValueForColorRoleHash() =>
    r'cc63bd18f0e3b15bd4bb6b34ef657fb966ab0c30';

abstract class _$RadioValueForColorRole extends $Notifier<ColorSchemeKey> {
  ColorSchemeKey build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ColorSchemeKey, ColorSchemeKey>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ColorSchemeKey, ColorSchemeKey>,
              ColorSchemeKey,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
