// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_scheme_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ColorSchemeData {

 ColorScheme get customColorScheme; Color get chosenColor; Color get seedColor;
/// Create a copy of ColorSchemeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorSchemeDataCopyWith<ColorSchemeData> get copyWith => _$ColorSchemeDataCopyWithImpl<ColorSchemeData>(this as ColorSchemeData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorSchemeData&&(identical(other.customColorScheme, customColorScheme) || other.customColorScheme == customColorScheme)&&(identical(other.chosenColor, chosenColor) || other.chosenColor == chosenColor)&&(identical(other.seedColor, seedColor) || other.seedColor == seedColor));
}


@override
int get hashCode => Object.hash(runtimeType,customColorScheme,chosenColor,seedColor);

@override
String toString() {
  return 'ColorSchemeData(customColorScheme: $customColorScheme, chosenColor: $chosenColor, seedColor: $seedColor)';
}


}

/// @nodoc
abstract mixin class $ColorSchemeDataCopyWith<$Res>  {
  factory $ColorSchemeDataCopyWith(ColorSchemeData value, $Res Function(ColorSchemeData) _then) = _$ColorSchemeDataCopyWithImpl;
@useResult
$Res call({
 ColorScheme customColorScheme, Color chosenColor, Color seedColor
});




}
/// @nodoc
class _$ColorSchemeDataCopyWithImpl<$Res>
    implements $ColorSchemeDataCopyWith<$Res> {
  _$ColorSchemeDataCopyWithImpl(this._self, this._then);

  final ColorSchemeData _self;
  final $Res Function(ColorSchemeData) _then;

/// Create a copy of ColorSchemeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customColorScheme = null,Object? chosenColor = null,Object? seedColor = null,}) {
  return _then(ColorSchemeData(
customColorScheme: null == customColorScheme ? _self.customColorScheme : customColorScheme // ignore: cast_nullable_to_non_nullable
as ColorScheme,chosenColor: null == chosenColor ? _self.chosenColor : chosenColor // ignore: cast_nullable_to_non_nullable
as Color,seedColor: null == seedColor ? _self.seedColor : seedColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorSchemeData].
extension ColorSchemeDataPatterns on ColorSchemeData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
