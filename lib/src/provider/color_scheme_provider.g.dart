// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_scheme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ColorSchemeSetter)
final colorSchemeSetterProvider = ColorSchemeSetterProvider._();

final class ColorSchemeSetterProvider
    extends $NotifierProvider<ColorSchemeSetter, ColorScheme> {
  ColorSchemeSetterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'colorSchemeSetterProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$colorSchemeSetterHash();

  @$internal
  @override
  ColorSchemeSetter create() => ColorSchemeSetter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorScheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorScheme>(value),
    );
  }
}

String _$colorSchemeSetterHash() => r'02b563ea523200158e1652a63f72b92bc21b62f8';

abstract class _$ColorSchemeSetter extends $Notifier<ColorScheme> {
  ColorScheme build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ColorScheme, ColorScheme>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ColorScheme, ColorScheme>, ColorScheme, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
