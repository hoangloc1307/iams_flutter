// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostState {

 List<Post> get items; bool get loading; String? get error; bool get hasMore; int get page;
/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostStateCopyWith<PostState> get copyWith => _$PostStateCopyWithImpl<PostState>(this as PostState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.error, error) || other.error == error)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),loading,error,hasMore,page);

@override
String toString() {
  return 'PostState(items: $items, loading: $loading, error: $error, hasMore: $hasMore, page: $page)';
}


}

/// @nodoc
abstract mixin class $PostStateCopyWith<$Res>  {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) _then) = _$PostStateCopyWithImpl;
@useResult
$Res call({
 List<Post> items, bool loading, String? error, bool hasMore, int page
});




}
/// @nodoc
class _$PostStateCopyWithImpl<$Res>
    implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._self, this._then);

  final PostState _self;
  final $Res Function(PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? loading = null,Object? error = freezed,Object? hasMore = null,Object? page = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Post>,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PostState].
extension PostStatePatterns on PostState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostState value)  $default,){
final _that = this;
switch (_that) {
case _PostState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostState value)?  $default,){
final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Post> items,  bool loading,  String? error,  bool hasMore,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that.items,_that.loading,_that.error,_that.hasMore,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Post> items,  bool loading,  String? error,  bool hasMore,  int page)  $default,) {final _that = this;
switch (_that) {
case _PostState():
return $default(_that.items,_that.loading,_that.error,_that.hasMore,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Post> items,  bool loading,  String? error,  bool hasMore,  int page)?  $default,) {final _that = this;
switch (_that) {
case _PostState() when $default != null:
return $default(_that.items,_that.loading,_that.error,_that.hasMore,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _PostState implements PostState {
  const _PostState({final  List<Post> items = const <Post>[], this.loading = false, this.error, this.hasMore = true, this.page = 1}): _items = items;
  

 final  List<Post> _items;
@override@JsonKey() List<Post> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool loading;
@override final  String? error;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int page;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostStateCopyWith<_PostState> get copyWith => __$PostStateCopyWithImpl<_PostState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.error, error) || other.error == error)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),loading,error,hasMore,page);

@override
String toString() {
  return 'PostState(items: $items, loading: $loading, error: $error, hasMore: $hasMore, page: $page)';
}


}

/// @nodoc
abstract mixin class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(_PostState value, $Res Function(_PostState) _then) = __$PostStateCopyWithImpl;
@override @useResult
$Res call({
 List<Post> items, bool loading, String? error, bool hasMore, int page
});




}
/// @nodoc
class __$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(this._self, this._then);

  final _PostState _self;
  final $Res Function(_PostState) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? loading = null,Object? error = freezed,Object? hasMore = null,Object? page = null,}) {
  return _then(_PostState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Post>,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
