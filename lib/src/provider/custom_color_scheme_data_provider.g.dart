// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_color_scheme_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// This class defines a riverpod provider for all data related to our own customColorSchemeData.
/// (that is: the ColorScheme itself as well a Color chosencolor which is
/// needed for constructing and finetuning themes)

@ProviderFor(CustomColorSchemeData)
final customColorSchemeDataProvider = CustomColorSchemeDataFamily._();

/// This class defines a riverpod provider for all data related to our own customColorSchemeData.
/// (that is: the ColorScheme itself as well a Color chosencolor which is
/// needed for constructing and finetuning themes)
final class CustomColorSchemeDataProvider
    extends $NotifierProvider<CustomColorSchemeData, ColorSchemeData> {
  /// This class defines a riverpod provider for all data related to our own customColorSchemeData.
  /// (that is: the ColorScheme itself as well a Color chosencolor which is
  /// needed for constructing and finetuning themes)
  CustomColorSchemeDataProvider._({
    required CustomColorSchemeDataFamily super.from,
    required ThemeController super.argument,
  }) : super(
         retry: null,
         name: r'customColorSchemeDataProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customColorSchemeDataHash();

  @override
  String toString() {
    return r'customColorSchemeDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CustomColorSchemeData create() => CustomColorSchemeData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorSchemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorSchemeData>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CustomColorSchemeDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customColorSchemeDataHash() =>
    r'b675ed6e7ea6e46a51863f2e9bf64e6310127036';

/// This class defines a riverpod provider for all data related to our own customColorSchemeData.
/// (that is: the ColorScheme itself as well a Color chosencolor which is
/// needed for constructing and finetuning themes)

final class CustomColorSchemeDataFamily extends $Family
    with
        $ClassFamilyOverride<
          CustomColorSchemeData,
          ColorSchemeData,
          ColorSchemeData,
          ColorSchemeData,
          ThemeController
        > {
  CustomColorSchemeDataFamily._()
    : super(
        retry: null,
        name: r'customColorSchemeDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// This class defines a riverpod provider for all data related to our own customColorSchemeData.
  /// (that is: the ColorScheme itself as well a Color chosencolor which is
  /// needed for constructing and finetuning themes)

  CustomColorSchemeDataProvider call(ThemeController themeController) =>
      CustomColorSchemeDataProvider._(argument: themeController, from: this);

  @override
  String toString() => r'customColorSchemeDataProvider';
}

/// This class defines a riverpod provider for all data related to our own customColorSchemeData.
/// (that is: the ColorScheme itself as well a Color chosencolor which is
/// needed for constructing and finetuning themes)

abstract class _$CustomColorSchemeData extends $Notifier<ColorSchemeData> {
  late final _$args = ref.$arg as ThemeController;
  ThemeController get themeController => _$args;

  ColorSchemeData build(ThemeController themeController);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ColorSchemeData, ColorSchemeData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ColorSchemeData, ColorSchemeData>,
              ColorSchemeData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
