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

String _$themeStateHash() => r'd6070975c26f37b7e82563a443875c4f5b0472cd';

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
