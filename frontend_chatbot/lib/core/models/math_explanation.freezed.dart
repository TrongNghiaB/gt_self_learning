// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'math_explanation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExplainRequest {

 String get query; String get locale; String? get model;
/// Create a copy of ExplainRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplainRequestCopyWith<ExplainRequest> get copyWith => _$ExplainRequestCopyWithImpl<ExplainRequest>(this as ExplainRequest, _$identity);

  /// Serializes this ExplainRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExplainRequest&&(identical(other.query, query) || other.query == query)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,locale,model);

@override
String toString() {
  return 'ExplainRequest(query: $query, locale: $locale, model: $model)';
}


}

/// @nodoc
abstract mixin class $ExplainRequestCopyWith<$Res>  {
  factory $ExplainRequestCopyWith(ExplainRequest value, $Res Function(ExplainRequest) _then) = _$ExplainRequestCopyWithImpl;
@useResult
$Res call({
 String query, String locale, String? model
});




}
/// @nodoc
class _$ExplainRequestCopyWithImpl<$Res>
    implements $ExplainRequestCopyWith<$Res> {
  _$ExplainRequestCopyWithImpl(this._self, this._then);

  final ExplainRequest _self;
  final $Res Function(ExplainRequest) _then;

/// Create a copy of ExplainRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? locale = null,Object? model = freezed,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExplainRequest].
extension ExplainRequestPatterns on ExplainRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExplainRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExplainRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExplainRequest value)  $default,){
final _that = this;
switch (_that) {
case _ExplainRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExplainRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ExplainRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  String locale,  String? model)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExplainRequest() when $default != null:
return $default(_that.query,_that.locale,_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  String locale,  String? model)  $default,) {final _that = this;
switch (_that) {
case _ExplainRequest():
return $default(_that.query,_that.locale,_that.model);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  String locale,  String? model)?  $default,) {final _that = this;
switch (_that) {
case _ExplainRequest() when $default != null:
return $default(_that.query,_that.locale,_that.model);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExplainRequest implements ExplainRequest {
  const _ExplainRequest({required this.query, this.locale = 'en', this.model});
  factory _ExplainRequest.fromJson(Map<String, dynamic> json) => _$ExplainRequestFromJson(json);

@override final  String query;
@override@JsonKey() final  String locale;
@override final  String? model;

/// Create a copy of ExplainRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplainRequestCopyWith<_ExplainRequest> get copyWith => __$ExplainRequestCopyWithImpl<_ExplainRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExplainRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExplainRequest&&(identical(other.query, query) || other.query == query)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,locale,model);

@override
String toString() {
  return 'ExplainRequest(query: $query, locale: $locale, model: $model)';
}


}

/// @nodoc
abstract mixin class _$ExplainRequestCopyWith<$Res> implements $ExplainRequestCopyWith<$Res> {
  factory _$ExplainRequestCopyWith(_ExplainRequest value, $Res Function(_ExplainRequest) _then) = __$ExplainRequestCopyWithImpl;
@override @useResult
$Res call({
 String query, String locale, String? model
});




}
/// @nodoc
class __$ExplainRequestCopyWithImpl<$Res>
    implements _$ExplainRequestCopyWith<$Res> {
  __$ExplainRequestCopyWithImpl(this._self, this._then);

  final _ExplainRequest _self;
  final $Res Function(_ExplainRequest) _then;

/// Create a copy of ExplainRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? locale = null,Object? model = freezed,}) {
  return _then(_ExplainRequest(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MathExplanation {

 String get topic; List<MathElement> get elements;
/// Create a copy of MathExplanation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MathExplanationCopyWith<MathExplanation> get copyWith => _$MathExplanationCopyWithImpl<MathExplanation>(this as MathExplanation, _$identity);

  /// Serializes this MathExplanation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MathExplanation&&(identical(other.topic, topic) || other.topic == topic)&&const DeepCollectionEquality().equals(other.elements, elements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,const DeepCollectionEquality().hash(elements));

@override
String toString() {
  return 'MathExplanation(topic: $topic, elements: $elements)';
}


}

/// @nodoc
abstract mixin class $MathExplanationCopyWith<$Res>  {
  factory $MathExplanationCopyWith(MathExplanation value, $Res Function(MathExplanation) _then) = _$MathExplanationCopyWithImpl;
@useResult
$Res call({
 String topic, List<MathElement> elements
});




}
/// @nodoc
class _$MathExplanationCopyWithImpl<$Res>
    implements $MathExplanationCopyWith<$Res> {
  _$MathExplanationCopyWithImpl(this._self, this._then);

  final MathExplanation _self;
  final $Res Function(MathExplanation) _then;

/// Create a copy of MathExplanation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? elements = null,}) {
  return _then(_self.copyWith(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,elements: null == elements ? _self.elements : elements // ignore: cast_nullable_to_non_nullable
as List<MathElement>,
  ));
}

}


/// Adds pattern-matching-related methods to [MathExplanation].
extension MathExplanationPatterns on MathExplanation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MathExplanation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MathExplanation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MathExplanation value)  $default,){
final _that = this;
switch (_that) {
case _MathExplanation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MathExplanation value)?  $default,){
final _that = this;
switch (_that) {
case _MathExplanation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String topic,  List<MathElement> elements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MathExplanation() when $default != null:
return $default(_that.topic,_that.elements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String topic,  List<MathElement> elements)  $default,) {final _that = this;
switch (_that) {
case _MathExplanation():
return $default(_that.topic,_that.elements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String topic,  List<MathElement> elements)?  $default,) {final _that = this;
switch (_that) {
case _MathExplanation() when $default != null:
return $default(_that.topic,_that.elements);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MathExplanation implements MathExplanation {
  const _MathExplanation({required this.topic, required final  List<MathElement> elements}): _elements = elements;
  factory _MathExplanation.fromJson(Map<String, dynamic> json) => _$MathExplanationFromJson(json);

@override final  String topic;
 final  List<MathElement> _elements;
@override List<MathElement> get elements {
  if (_elements is EqualUnmodifiableListView) return _elements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elements);
}


/// Create a copy of MathExplanation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MathExplanationCopyWith<_MathExplanation> get copyWith => __$MathExplanationCopyWithImpl<_MathExplanation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MathExplanationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MathExplanation&&(identical(other.topic, topic) || other.topic == topic)&&const DeepCollectionEquality().equals(other._elements, _elements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,const DeepCollectionEquality().hash(_elements));

@override
String toString() {
  return 'MathExplanation(topic: $topic, elements: $elements)';
}


}

/// @nodoc
abstract mixin class _$MathExplanationCopyWith<$Res> implements $MathExplanationCopyWith<$Res> {
  factory _$MathExplanationCopyWith(_MathExplanation value, $Res Function(_MathExplanation) _then) = __$MathExplanationCopyWithImpl;
@override @useResult
$Res call({
 String topic, List<MathElement> elements
});




}
/// @nodoc
class __$MathExplanationCopyWithImpl<$Res>
    implements _$MathExplanationCopyWith<$Res> {
  __$MathExplanationCopyWithImpl(this._self, this._then);

  final _MathExplanation _self;
  final $Res Function(_MathExplanation) _then;

/// Create a copy of MathExplanation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? elements = null,}) {
  return _then(_MathExplanation(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,elements: null == elements ? _self._elements : elements // ignore: cast_nullable_to_non_nullable
as List<MathElement>,
  ));
}


}

MathElement _$MathElementFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'text_block':
          return _TextBlock.fromJson(
            json
          );
                case 'example_steps':
          return _ExampleSteps.fromJson(
            json
          );
                case 'bar_chart':
          return _BarChart.fromJson(
            json
          );
                case 'horizontal_blocks':
          return _HorizontalBlocks.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'MathElement',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$MathElement {

 String get id; int get order; String get title; String? get caption;
/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MathElementCopyWith<MathElement> get copyWith => _$MathElementCopyWithImpl<MathElement>(this as MathElement, _$identity);

  /// Serializes this MathElement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MathElement&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption);

@override
String toString() {
  return 'MathElement(id: $id, order: $order, title: $title, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $MathElementCopyWith<$Res>  {
  factory $MathElementCopyWith(MathElement value, $Res Function(MathElement) _then) = _$MathElementCopyWithImpl;
@useResult
$Res call({
 String id, int order, String title, String? caption
});




}
/// @nodoc
class _$MathElementCopyWithImpl<$Res>
    implements $MathElementCopyWith<$Res> {
  _$MathElementCopyWithImpl(this._self, this._then);

  final MathElement _self;
  final $Res Function(MathElement) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? title = null,Object? caption = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MathElement].
extension MathElementPatterns on MathElement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TextBlock value)?  text_block,TResult Function( _ExampleSteps value)?  example_steps,TResult Function( _BarChart value)?  bar_chart,TResult Function( _HorizontalBlocks value)?  horizontal_blocks,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextBlock() when text_block != null:
return text_block(_that);case _ExampleSteps() when example_steps != null:
return example_steps(_that);case _BarChart() when bar_chart != null:
return bar_chart(_that);case _HorizontalBlocks() when horizontal_blocks != null:
return horizontal_blocks(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TextBlock value)  text_block,required TResult Function( _ExampleSteps value)  example_steps,required TResult Function( _BarChart value)  bar_chart,required TResult Function( _HorizontalBlocks value)  horizontal_blocks,}){
final _that = this;
switch (_that) {
case _TextBlock():
return text_block(_that);case _ExampleSteps():
return example_steps(_that);case _BarChart():
return bar_chart(_that);case _HorizontalBlocks():
return horizontal_blocks(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TextBlock value)?  text_block,TResult? Function( _ExampleSteps value)?  example_steps,TResult? Function( _BarChart value)?  bar_chart,TResult? Function( _HorizontalBlocks value)?  horizontal_blocks,}){
final _that = this;
switch (_that) {
case _TextBlock() when text_block != null:
return text_block(_that);case _ExampleSteps() when example_steps != null:
return example_steps(_that);case _BarChart() when bar_chart != null:
return bar_chart(_that);case _HorizontalBlocks() when horizontal_blocks != null:
return horizontal_blocks(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  int order,  String title,  String? caption,  String text)?  text_block,TResult Function( String id,  int order,  String title,  String? caption,  List<String> steps)?  example_steps,TResult Function( String id,  int order,  String title,  String? caption,  List<double> data,  List<String> labels, @JsonKey(name: 'image_base64')  String? imageBase64)?  bar_chart,TResult Function( String id,  int order,  String title,  String? caption,  List<HorizontalItem> items)?  horizontal_blocks,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextBlock() when text_block != null:
return text_block(_that.id,_that.order,_that.title,_that.caption,_that.text);case _ExampleSteps() when example_steps != null:
return example_steps(_that.id,_that.order,_that.title,_that.caption,_that.steps);case _BarChart() when bar_chart != null:
return bar_chart(_that.id,_that.order,_that.title,_that.caption,_that.data,_that.labels,_that.imageBase64);case _HorizontalBlocks() when horizontal_blocks != null:
return horizontal_blocks(_that.id,_that.order,_that.title,_that.caption,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  int order,  String title,  String? caption,  String text)  text_block,required TResult Function( String id,  int order,  String title,  String? caption,  List<String> steps)  example_steps,required TResult Function( String id,  int order,  String title,  String? caption,  List<double> data,  List<String> labels, @JsonKey(name: 'image_base64')  String? imageBase64)  bar_chart,required TResult Function( String id,  int order,  String title,  String? caption,  List<HorizontalItem> items)  horizontal_blocks,}) {final _that = this;
switch (_that) {
case _TextBlock():
return text_block(_that.id,_that.order,_that.title,_that.caption,_that.text);case _ExampleSteps():
return example_steps(_that.id,_that.order,_that.title,_that.caption,_that.steps);case _BarChart():
return bar_chart(_that.id,_that.order,_that.title,_that.caption,_that.data,_that.labels,_that.imageBase64);case _HorizontalBlocks():
return horizontal_blocks(_that.id,_that.order,_that.title,_that.caption,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  int order,  String title,  String? caption,  String text)?  text_block,TResult? Function( String id,  int order,  String title,  String? caption,  List<String> steps)?  example_steps,TResult? Function( String id,  int order,  String title,  String? caption,  List<double> data,  List<String> labels, @JsonKey(name: 'image_base64')  String? imageBase64)?  bar_chart,TResult? Function( String id,  int order,  String title,  String? caption,  List<HorizontalItem> items)?  horizontal_blocks,}) {final _that = this;
switch (_that) {
case _TextBlock() when text_block != null:
return text_block(_that.id,_that.order,_that.title,_that.caption,_that.text);case _ExampleSteps() when example_steps != null:
return example_steps(_that.id,_that.order,_that.title,_that.caption,_that.steps);case _BarChart() when bar_chart != null:
return bar_chart(_that.id,_that.order,_that.title,_that.caption,_that.data,_that.labels,_that.imageBase64);case _HorizontalBlocks() when horizontal_blocks != null:
return horizontal_blocks(_that.id,_that.order,_that.title,_that.caption,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextBlock implements MathElement {
  const _TextBlock({required this.id, required this.order, required this.title, this.caption, required this.text, final  String? $type}): $type = $type ?? 'text_block';
  factory _TextBlock.fromJson(Map<String, dynamic> json) => _$TextBlockFromJson(json);

@override final  String id;
@override final  int order;
@override final  String title;
@override final  String? caption;
 final  String text;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextBlockCopyWith<_TextBlock> get copyWith => __$TextBlockCopyWithImpl<_TextBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,text);

@override
String toString() {
  return 'MathElement.text_block(id: $id, order: $order, title: $title, caption: $caption, text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextBlockCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$TextBlockCopyWith(_TextBlock value, $Res Function(_TextBlock) _then) = __$TextBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String title, String? caption, String text
});




}
/// @nodoc
class __$TextBlockCopyWithImpl<$Res>
    implements _$TextBlockCopyWith<$Res> {
  __$TextBlockCopyWithImpl(this._self, this._then);

  final _TextBlock _self;
  final $Res Function(_TextBlock) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = null,Object? caption = freezed,Object? text = null,}) {
  return _then(_TextBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ExampleSteps implements MathElement {
  const _ExampleSteps({required this.id, required this.order, required this.title, this.caption, required final  List<String> steps, final  String? $type}): _steps = steps,$type = $type ?? 'example_steps';
  factory _ExampleSteps.fromJson(Map<String, dynamic> json) => _$ExampleStepsFromJson(json);

@override final  String id;
@override final  int order;
@override final  String title;
@override final  String? caption;
 final  List<String> _steps;
 List<String> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleStepsCopyWith<_ExampleSteps> get copyWith => __$ExampleStepsCopyWithImpl<_ExampleSteps>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleStepsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleSteps&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'MathElement.example_steps(id: $id, order: $order, title: $title, caption: $caption, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$ExampleStepsCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$ExampleStepsCopyWith(_ExampleSteps value, $Res Function(_ExampleSteps) _then) = __$ExampleStepsCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String title, String? caption, List<String> steps
});




}
/// @nodoc
class __$ExampleStepsCopyWithImpl<$Res>
    implements _$ExampleStepsCopyWith<$Res> {
  __$ExampleStepsCopyWithImpl(this._self, this._then);

  final _ExampleSteps _self;
  final $Res Function(_ExampleSteps) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = null,Object? caption = freezed,Object? steps = null,}) {
  return _then(_ExampleSteps(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _BarChart implements MathElement {
  const _BarChart({required this.id, required this.order, required this.title, this.caption, required final  List<double> data, required final  List<String> labels, @JsonKey(name: 'image_base64') this.imageBase64, final  String? $type}): _data = data,_labels = labels,$type = $type ?? 'bar_chart';
  factory _BarChart.fromJson(Map<String, dynamic> json) => _$BarChartFromJson(json);

@override final  String id;
@override final  int order;
@override final  String title;
@override final  String? caption;
 final  List<double> _data;
 List<double> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

 final  List<String> _labels;
 List<String> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}

@JsonKey(name: 'image_base64') final  String? imageBase64;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BarChartCopyWith<_BarChart> get copyWith => __$BarChartCopyWithImpl<_BarChart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BarChartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BarChart&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._data, _data)&&const DeepCollectionEquality().equals(other._labels, _labels)&&(identical(other.imageBase64, imageBase64) || other.imageBase64 == imageBase64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,const DeepCollectionEquality().hash(_data),const DeepCollectionEquality().hash(_labels),imageBase64);

@override
String toString() {
  return 'MathElement.bar_chart(id: $id, order: $order, title: $title, caption: $caption, data: $data, labels: $labels, imageBase64: $imageBase64)';
}


}

/// @nodoc
abstract mixin class _$BarChartCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$BarChartCopyWith(_BarChart value, $Res Function(_BarChart) _then) = __$BarChartCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String title, String? caption, List<double> data, List<String> labels,@JsonKey(name: 'image_base64') String? imageBase64
});




}
/// @nodoc
class __$BarChartCopyWithImpl<$Res>
    implements _$BarChartCopyWith<$Res> {
  __$BarChartCopyWithImpl(this._self, this._then);

  final _BarChart _self;
  final $Res Function(_BarChart) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = null,Object? caption = freezed,Object? data = null,Object? labels = null,Object? imageBase64 = freezed,}) {
  return _then(_BarChart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<double>,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,imageBase64: freezed == imageBase64 ? _self.imageBase64 : imageBase64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _HorizontalBlocks implements MathElement {
  const _HorizontalBlocks({required this.id, required this.order, required this.title, this.caption, required final  List<HorizontalItem> items, final  String? $type}): _items = items,$type = $type ?? 'horizontal_blocks';
  factory _HorizontalBlocks.fromJson(Map<String, dynamic> json) => _$HorizontalBlocksFromJson(json);

@override final  String id;
@override final  int order;
@override final  String title;
@override final  String? caption;
 final  List<HorizontalItem> _items;
 List<HorizontalItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HorizontalBlocksCopyWith<_HorizontalBlocks> get copyWith => __$HorizontalBlocksCopyWithImpl<_HorizontalBlocks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HorizontalBlocksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HorizontalBlocks&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MathElement.horizontal_blocks(id: $id, order: $order, title: $title, caption: $caption, items: $items)';
}


}

/// @nodoc
abstract mixin class _$HorizontalBlocksCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$HorizontalBlocksCopyWith(_HorizontalBlocks value, $Res Function(_HorizontalBlocks) _then) = __$HorizontalBlocksCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String title, String? caption, List<HorizontalItem> items
});




}
/// @nodoc
class __$HorizontalBlocksCopyWithImpl<$Res>
    implements _$HorizontalBlocksCopyWith<$Res> {
  __$HorizontalBlocksCopyWithImpl(this._self, this._then);

  final _HorizontalBlocks _self;
  final $Res Function(_HorizontalBlocks) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = null,Object? caption = freezed,Object? items = null,}) {
  return _then(_HorizontalBlocks(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HorizontalItem>,
  ));
}


}


/// @nodoc
mixin _$HorizontalItem {

 String get title; String get desc;
/// Create a copy of HorizontalItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HorizontalItemCopyWith<HorizontalItem> get copyWith => _$HorizontalItemCopyWithImpl<HorizontalItem>(this as HorizontalItem, _$identity);

  /// Serializes this HorizontalItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HorizontalItem&&(identical(other.title, title) || other.title == title)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,desc);

@override
String toString() {
  return 'HorizontalItem(title: $title, desc: $desc)';
}


}

/// @nodoc
abstract mixin class $HorizontalItemCopyWith<$Res>  {
  factory $HorizontalItemCopyWith(HorizontalItem value, $Res Function(HorizontalItem) _then) = _$HorizontalItemCopyWithImpl;
@useResult
$Res call({
 String title, String desc
});




}
/// @nodoc
class _$HorizontalItemCopyWithImpl<$Res>
    implements $HorizontalItemCopyWith<$Res> {
  _$HorizontalItemCopyWithImpl(this._self, this._then);

  final HorizontalItem _self;
  final $Res Function(HorizontalItem) _then;

/// Create a copy of HorizontalItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? desc = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HorizontalItem].
extension HorizontalItemPatterns on HorizontalItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HorizontalItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HorizontalItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HorizontalItem value)  $default,){
final _that = this;
switch (_that) {
case _HorizontalItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HorizontalItem value)?  $default,){
final _that = this;
switch (_that) {
case _HorizontalItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String desc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HorizontalItem() when $default != null:
return $default(_that.title,_that.desc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String desc)  $default,) {final _that = this;
switch (_that) {
case _HorizontalItem():
return $default(_that.title,_that.desc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String desc)?  $default,) {final _that = this;
switch (_that) {
case _HorizontalItem() when $default != null:
return $default(_that.title,_that.desc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HorizontalItem implements HorizontalItem {
  const _HorizontalItem({required this.title, required this.desc});
  factory _HorizontalItem.fromJson(Map<String, dynamic> json) => _$HorizontalItemFromJson(json);

@override final  String title;
@override final  String desc;

/// Create a copy of HorizontalItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HorizontalItemCopyWith<_HorizontalItem> get copyWith => __$HorizontalItemCopyWithImpl<_HorizontalItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HorizontalItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HorizontalItem&&(identical(other.title, title) || other.title == title)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,desc);

@override
String toString() {
  return 'HorizontalItem(title: $title, desc: $desc)';
}


}

/// @nodoc
abstract mixin class _$HorizontalItemCopyWith<$Res> implements $HorizontalItemCopyWith<$Res> {
  factory _$HorizontalItemCopyWith(_HorizontalItem value, $Res Function(_HorizontalItem) _then) = __$HorizontalItemCopyWithImpl;
@override @useResult
$Res call({
 String title, String desc
});




}
/// @nodoc
class __$HorizontalItemCopyWithImpl<$Res>
    implements _$HorizontalItemCopyWith<$Res> {
  __$HorizontalItemCopyWithImpl(this._self, this._then);

  final _HorizontalItem _self;
  final $Res Function(_HorizontalItem) _then;

/// Create a copy of HorizontalItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? desc = null,}) {
  return _then(_HorizontalItem(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
