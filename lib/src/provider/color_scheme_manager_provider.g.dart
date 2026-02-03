// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_scheme_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ColorSchemeManager)
final colorSchemeManagerProvider = ColorSchemeManagerProvider._();

final class ColorSchemeManagerProvider
    extends $NotifierProvider<ColorSchemeManager, ColorScheme> {
  ColorSchemeManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorSchemeManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorSchemeManagerHash();

  @$internal
  @override
  ColorSchemeManager create() => ColorSchemeManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorScheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorScheme>(value),
    );
  }
}

String _$colorSchemeManagerHash() =>
    r'8882067386972f75994dc0a323a540477e5cfbd3';

abstract class _$ColorSchemeManager extends $Notifier<ColorScheme> {
  ColorScheme build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ColorScheme, ColorScheme>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ColorScheme, ColorScheme>,
              ColorScheme,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
