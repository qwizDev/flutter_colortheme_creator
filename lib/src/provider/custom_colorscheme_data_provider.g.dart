// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_colorscheme_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomColorschemeData)
final customColorschemeDataProvider = CustomColorschemeDataFamily._();

final class CustomColorschemeDataProvider
    extends $NotifierProvider<CustomColorschemeData, ColorschemeData> {
  CustomColorschemeDataProvider._({
    required CustomColorschemeDataFamily super.from,
    required ThemeController super.argument,
  }) : super(
         retry: null,
         name: r'customColorschemeDataProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customColorschemeDataHash();

  @override
  String toString() {
    return r'customColorschemeDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CustomColorschemeData create() => CustomColorschemeData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorschemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorschemeData>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CustomColorschemeDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customColorschemeDataHash() =>
    r'f19afb37647f3c9ab672e7496c11ed06fc543a69';

final class CustomColorschemeDataFamily extends $Family
    with
        $ClassFamilyOverride<
          CustomColorschemeData,
          ColorschemeData,
          ColorschemeData,
          ColorschemeData,
          ThemeController
        > {
  CustomColorschemeDataFamily._()
    : super(
        retry: null,
        name: r'customColorschemeDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CustomColorschemeDataProvider call(ThemeController themeController) =>
      CustomColorschemeDataProvider._(argument: themeController, from: this);

  @override
  String toString() => r'customColorschemeDataProvider';
}

abstract class _$CustomColorschemeData extends $Notifier<ColorschemeData> {
  late final _$args = ref.$arg as ThemeController;
  ThemeController get themeController => _$args;

  ColorschemeData build(ThemeController themeController);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ColorschemeData, ColorschemeData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ColorschemeData, ColorschemeData>,
              ColorschemeData,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
