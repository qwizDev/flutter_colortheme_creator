// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'themedata_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeDataState {

 Color get seedColor; ColorScheme get colorScheme; ThemeData get themeData;
/// Create a copy of ThemeDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeDataStateCopyWith<ThemeDataState> get copyWith => _$ThemeDataStateCopyWithImpl<ThemeDataState>(this as ThemeDataState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeDataState&&(identical(other.seedColor, seedColor) || other.seedColor == seedColor)&&(identical(other.colorScheme, colorScheme) || other.colorScheme == colorScheme)&&(identical(other.themeData, themeData) || other.themeData == themeData));
}


@override
int get hashCode => Object.hash(runtimeType,seedColor,colorScheme,themeData);

@override
String toString() {
  return 'ThemeDataState(seedColor: $seedColor, colorScheme: $colorScheme, themeData: $themeData)';
}


}

/// @nodoc
abstract mixin class $ThemeDataStateCopyWith<$Res>  {
  factory $ThemeDataStateCopyWith(ThemeDataState value, $Res Function(ThemeDataState) _then) = _$ThemeDataStateCopyWithImpl;
@useResult
$Res call({
 Color seedColor, ColorScheme colorScheme, ThemeData themeData
});




}
/// @nodoc
class _$ThemeDataStateCopyWithImpl<$Res>
    implements $ThemeDataStateCopyWith<$Res> {
  _$ThemeDataStateCopyWithImpl(this._self, this._then);

  final ThemeDataState _self;
  final $Res Function(ThemeDataState) _then;

/// Create a copy of ThemeDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seedColor = null,Object? colorScheme = null,Object? themeData = null,}) {
  return _then(ThemeDataState(
seedColor: null == seedColor ? _self.seedColor : seedColor // ignore: cast_nullable_to_non_nullable
as Color,colorScheme: null == colorScheme ? _self.colorScheme : colorScheme // ignore: cast_nullable_to_non_nullable
as ColorScheme,themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeDataState].
extension ThemeDataStatePatterns on ThemeDataState {
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
