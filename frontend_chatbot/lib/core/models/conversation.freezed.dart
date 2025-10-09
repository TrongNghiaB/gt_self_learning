// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationSummary {

 String get id; String get topic;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'image_count') int get imageCount;
/// Create a copy of ConversationSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationSummaryCopyWith<ConversationSummary> get copyWith => _$ConversationSummaryCopyWithImpl<ConversationSummary>(this as ConversationSummary, _$identity);

  /// Serializes this ConversationSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,topic,createdAt,updatedAt,imageCount);

@override
String toString() {
  return 'ConversationSummary(id: $id, topic: $topic, createdAt: $createdAt, updatedAt: $updatedAt, imageCount: $imageCount)';
}


}

/// @nodoc
abstract mixin class $ConversationSummaryCopyWith<$Res>  {
  factory $ConversationSummaryCopyWith(ConversationSummary value, $Res Function(ConversationSummary) _then) = _$ConversationSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String topic,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'image_count') int imageCount
});




}
/// @nodoc
class _$ConversationSummaryCopyWithImpl<$Res>
    implements $ConversationSummaryCopyWith<$Res> {
  _$ConversationSummaryCopyWithImpl(this._self, this._then);

  final ConversationSummary _self;
  final $Res Function(ConversationSummary) _then;

/// Create a copy of ConversationSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? topic = null,Object? createdAt = null,Object? updatedAt = null,Object? imageCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationSummary].
extension ConversationSummaryPatterns on ConversationSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationSummary value)  $default,){
final _that = this;
switch (_that) {
case _ConversationSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String topic, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'image_count')  int imageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationSummary() when $default != null:
return $default(_that.id,_that.topic,_that.createdAt,_that.updatedAt,_that.imageCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String topic, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'image_count')  int imageCount)  $default,) {final _that = this;
switch (_that) {
case _ConversationSummary():
return $default(_that.id,_that.topic,_that.createdAt,_that.updatedAt,_that.imageCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String topic, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'image_count')  int imageCount)?  $default,) {final _that = this;
switch (_that) {
case _ConversationSummary() when $default != null:
return $default(_that.id,_that.topic,_that.createdAt,_that.updatedAt,_that.imageCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationSummary implements ConversationSummary {
  const _ConversationSummary({required this.id, required this.topic, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'image_count') required this.imageCount});
  factory _ConversationSummary.fromJson(Map<String, dynamic> json) => _$ConversationSummaryFromJson(json);

@override final  String id;
@override final  String topic;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'image_count') final  int imageCount;

/// Create a copy of ConversationSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationSummaryCopyWith<_ConversationSummary> get copyWith => __$ConversationSummaryCopyWithImpl<_ConversationSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,topic,createdAt,updatedAt,imageCount);

@override
String toString() {
  return 'ConversationSummary(id: $id, topic: $topic, createdAt: $createdAt, updatedAt: $updatedAt, imageCount: $imageCount)';
}


}

/// @nodoc
abstract mixin class _$ConversationSummaryCopyWith<$Res> implements $ConversationSummaryCopyWith<$Res> {
  factory _$ConversationSummaryCopyWith(_ConversationSummary value, $Res Function(_ConversationSummary) _then) = __$ConversationSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String topic,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'image_count') int imageCount
});




}
/// @nodoc
class __$ConversationSummaryCopyWithImpl<$Res>
    implements _$ConversationSummaryCopyWith<$Res> {
  __$ConversationSummaryCopyWithImpl(this._self, this._then);

  final _ConversationSummary _self;
  final $Res Function(_ConversationSummary) _then;

/// Create a copy of ConversationSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? topic = null,Object? createdAt = null,Object? updatedAt = null,Object? imageCount = null,}) {
  return _then(_ConversationSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ConversationDetail {

 String get id; String get topic; String get query; List<MathElement> get elements;@JsonKey(name: 'image_paths') List<String> get imagePaths;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ConversationDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationDetailCopyWith<ConversationDetail> get copyWith => _$ConversationDetailCopyWithImpl<ConversationDetail>(this as ConversationDetail, _$identity);

  /// Serializes this ConversationDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.elements, elements)&&const DeepCollectionEquality().equals(other.imagePaths, imagePaths)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,topic,query,const DeepCollectionEquality().hash(elements),const DeepCollectionEquality().hash(imagePaths),createdAt,updatedAt);

@override
String toString() {
  return 'ConversationDetail(id: $id, topic: $topic, query: $query, elements: $elements, imagePaths: $imagePaths, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ConversationDetailCopyWith<$Res>  {
  factory $ConversationDetailCopyWith(ConversationDetail value, $Res Function(ConversationDetail) _then) = _$ConversationDetailCopyWithImpl;
@useResult
$Res call({
 String id, String topic, String query, List<MathElement> elements,@JsonKey(name: 'image_paths') List<String> imagePaths,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ConversationDetailCopyWithImpl<$Res>
    implements $ConversationDetailCopyWith<$Res> {
  _$ConversationDetailCopyWithImpl(this._self, this._then);

  final ConversationDetail _self;
  final $Res Function(ConversationDetail) _then;

/// Create a copy of ConversationDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? topic = null,Object? query = null,Object? elements = null,Object? imagePaths = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,elements: null == elements ? _self.elements : elements // ignore: cast_nullable_to_non_nullable
as List<MathElement>,imagePaths: null == imagePaths ? _self.imagePaths : imagePaths // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationDetail].
extension ConversationDetailPatterns on ConversationDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationDetail value)  $default,){
final _that = this;
switch (_that) {
case _ConversationDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String topic,  String query,  List<MathElement> elements, @JsonKey(name: 'image_paths')  List<String> imagePaths, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationDetail() when $default != null:
return $default(_that.id,_that.topic,_that.query,_that.elements,_that.imagePaths,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String topic,  String query,  List<MathElement> elements, @JsonKey(name: 'image_paths')  List<String> imagePaths, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ConversationDetail():
return $default(_that.id,_that.topic,_that.query,_that.elements,_that.imagePaths,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String topic,  String query,  List<MathElement> elements, @JsonKey(name: 'image_paths')  List<String> imagePaths, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ConversationDetail() when $default != null:
return $default(_that.id,_that.topic,_that.query,_that.elements,_that.imagePaths,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationDetail implements ConversationDetail {
  const _ConversationDetail({required this.id, required this.topic, required this.query, required final  List<MathElement> elements, @JsonKey(name: 'image_paths') required final  List<String> imagePaths, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _elements = elements,_imagePaths = imagePaths;
  factory _ConversationDetail.fromJson(Map<String, dynamic> json) => _$ConversationDetailFromJson(json);

@override final  String id;
@override final  String topic;
@override final  String query;
 final  List<MathElement> _elements;
@override List<MathElement> get elements {
  if (_elements is EqualUnmodifiableListView) return _elements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elements);
}

 final  List<String> _imagePaths;
@override@JsonKey(name: 'image_paths') List<String> get imagePaths {
  if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imagePaths);
}

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ConversationDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationDetailCopyWith<_ConversationDetail> get copyWith => __$ConversationDetailCopyWithImpl<_ConversationDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._elements, _elements)&&const DeepCollectionEquality().equals(other._imagePaths, _imagePaths)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,topic,query,const DeepCollectionEquality().hash(_elements),const DeepCollectionEquality().hash(_imagePaths),createdAt,updatedAt);

@override
String toString() {
  return 'ConversationDetail(id: $id, topic: $topic, query: $query, elements: $elements, imagePaths: $imagePaths, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ConversationDetailCopyWith<$Res> implements $ConversationDetailCopyWith<$Res> {
  factory _$ConversationDetailCopyWith(_ConversationDetail value, $Res Function(_ConversationDetail) _then) = __$ConversationDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String topic, String query, List<MathElement> elements,@JsonKey(name: 'image_paths') List<String> imagePaths,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ConversationDetailCopyWithImpl<$Res>
    implements _$ConversationDetailCopyWith<$Res> {
  __$ConversationDetailCopyWithImpl(this._self, this._then);

  final _ConversationDetail _self;
  final $Res Function(_ConversationDetail) _then;

/// Create a copy of ConversationDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? topic = null,Object? query = null,Object? elements = null,Object? imagePaths = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ConversationDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,elements: null == elements ? _self._elements : elements // ignore: cast_nullable_to_non_nullable
as List<MathElement>,imagePaths: null == imagePaths ? _self._imagePaths : imagePaths // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ConversationListResponse {

 List<ConversationSummary> get conversations;@JsonKey(name: 'next_cursor') String? get nextCursor;@JsonKey(name: 'has_more') bool get hasMore; int get count;
/// Create a copy of ConversationListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationListResponseCopyWith<ConversationListResponse> get copyWith => _$ConversationListResponseCopyWithImpl<ConversationListResponse>(this as ConversationListResponse, _$identity);

  /// Serializes this ConversationListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationListResponse&&const DeepCollectionEquality().equals(other.conversations, conversations)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(conversations),nextCursor,hasMore,count);

@override
String toString() {
  return 'ConversationListResponse(conversations: $conversations, nextCursor: $nextCursor, hasMore: $hasMore, count: $count)';
}


}

/// @nodoc
abstract mixin class $ConversationListResponseCopyWith<$Res>  {
  factory $ConversationListResponseCopyWith(ConversationListResponse value, $Res Function(ConversationListResponse) _then) = _$ConversationListResponseCopyWithImpl;
@useResult
$Res call({
 List<ConversationSummary> conversations,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'has_more') bool hasMore, int count
});




}
/// @nodoc
class _$ConversationListResponseCopyWithImpl<$Res>
    implements $ConversationListResponseCopyWith<$Res> {
  _$ConversationListResponseCopyWithImpl(this._self, this._then);

  final ConversationListResponse _self;
  final $Res Function(ConversationListResponse) _then;

/// Create a copy of ConversationListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversations = null,Object? nextCursor = freezed,Object? hasMore = null,Object? count = null,}) {
  return _then(_self.copyWith(
conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationSummary>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationListResponse].
extension ConversationListResponsePatterns on ConversationListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConversationListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ConversationSummary> conversations, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationListResponse() when $default != null:
return $default(_that.conversations,_that.nextCursor,_that.hasMore,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ConversationSummary> conversations, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore,  int count)  $default,) {final _that = this;
switch (_that) {
case _ConversationListResponse():
return $default(_that.conversations,_that.nextCursor,_that.hasMore,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ConversationSummary> conversations, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore,  int count)?  $default,) {final _that = this;
switch (_that) {
case _ConversationListResponse() when $default != null:
return $default(_that.conversations,_that.nextCursor,_that.hasMore,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationListResponse implements ConversationListResponse {
  const _ConversationListResponse({required final  List<ConversationSummary> conversations, @JsonKey(name: 'next_cursor') this.nextCursor, @JsonKey(name: 'has_more') required this.hasMore, required this.count}): _conversations = conversations;
  factory _ConversationListResponse.fromJson(Map<String, dynamic> json) => _$ConversationListResponseFromJson(json);

 final  List<ConversationSummary> _conversations;
@override List<ConversationSummary> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

@override@JsonKey(name: 'next_cursor') final  String? nextCursor;
@override@JsonKey(name: 'has_more') final  bool hasMore;
@override final  int count;

/// Create a copy of ConversationListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationListResponseCopyWith<_ConversationListResponse> get copyWith => __$ConversationListResponseCopyWithImpl<_ConversationListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationListResponse&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations),nextCursor,hasMore,count);

@override
String toString() {
  return 'ConversationListResponse(conversations: $conversations, nextCursor: $nextCursor, hasMore: $hasMore, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ConversationListResponseCopyWith<$Res> implements $ConversationListResponseCopyWith<$Res> {
  factory _$ConversationListResponseCopyWith(_ConversationListResponse value, $Res Function(_ConversationListResponse) _then) = __$ConversationListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ConversationSummary> conversations,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'has_more') bool hasMore, int count
});




}
/// @nodoc
class __$ConversationListResponseCopyWithImpl<$Res>
    implements _$ConversationListResponseCopyWith<$Res> {
  __$ConversationListResponseCopyWithImpl(this._self, this._then);

  final _ConversationListResponse _self;
  final $Res Function(_ConversationListResponse) _then;

/// Create a copy of ConversationListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversations = null,Object? nextCursor = freezed,Object? hasMore = null,Object? count = null,}) {
  return _then(_ConversationListResponse(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationSummary>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
