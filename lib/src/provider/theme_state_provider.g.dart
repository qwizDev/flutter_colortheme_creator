// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeState)
final themeStateProvider = ThemeStateProvider._();

final class ThemeStateProvider
    extends $NotifierProvider<ThemeState, ThemeDataState> {
  ThemeStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeStateHash();

  @$internal
  @override
  ThemeState create() => ThemeState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeDataState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeDataState>(value),
    );
  }
}

String _$themeStateHash() => r'5847790f13c1f8d20612bc986c70baf259f30448';

abstract class _$ThemeState extends $Notifier<ThemeDataState> {
  ThemeDataState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeDataState, ThemeDataState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeDataState, ThemeDataState>,
              ThemeDataState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
