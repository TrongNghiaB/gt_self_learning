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
mixin _$ExplainResponse {

 String get topic; List<MathElement> get elements;
/// Create a copy of ExplainResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplainResponseCopyWith<ExplainResponse> get copyWith => _$ExplainResponseCopyWithImpl<ExplainResponse>(this as ExplainResponse, _$identity);

  /// Serializes this ExplainResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExplainResponse&&(identical(other.topic, topic) || other.topic == topic)&&const DeepCollectionEquality().equals(other.elements, elements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,const DeepCollectionEquality().hash(elements));

@override
String toString() {
  return 'ExplainResponse(topic: $topic, elements: $elements)';
}


}

/// @nodoc
abstract mixin class $ExplainResponseCopyWith<$Res>  {
  factory $ExplainResponseCopyWith(ExplainResponse value, $Res Function(ExplainResponse) _then) = _$ExplainResponseCopyWithImpl;
@useResult
$Res call({
 String topic, List<MathElement> elements
});




}
/// @nodoc
class _$ExplainResponseCopyWithImpl<$Res>
    implements $ExplainResponseCopyWith<$Res> {
  _$ExplainResponseCopyWithImpl(this._self, this._then);

  final ExplainResponse _self;
  final $Res Function(ExplainResponse) _then;

/// Create a copy of ExplainResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? elements = null,}) {
  return _then(_self.copyWith(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,elements: null == elements ? _self.elements : elements // ignore: cast_nullable_to_non_nullable
as List<MathElement>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExplainResponse].
extension ExplainResponsePatterns on ExplainResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExplainResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExplainResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExplainResponse value)  $default,){
final _that = this;
switch (_that) {
case _ExplainResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExplainResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ExplainResponse() when $default != null:
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
case _ExplainResponse() when $default != null:
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
case _ExplainResponse():
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
case _ExplainResponse() when $default != null:
return $default(_that.topic,_that.elements);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ExplainResponse implements ExplainResponse {
  const _ExplainResponse({required this.topic, required final  List<MathElement> elements}): _elements = elements;
  factory _ExplainResponse.fromJson(Map<String, dynamic> json) => _$ExplainResponseFromJson(json);

@override final  String topic;
 final  List<MathElement> _elements;
@override List<MathElement> get elements {
  if (_elements is EqualUnmodifiableListView) return _elements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elements);
}


/// Create a copy of ExplainResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplainResponseCopyWith<_ExplainResponse> get copyWith => __$ExplainResponseCopyWithImpl<_ExplainResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExplainResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExplainResponse&&(identical(other.topic, topic) || other.topic == topic)&&const DeepCollectionEquality().equals(other._elements, _elements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,const DeepCollectionEquality().hash(_elements));

@override
String toString() {
  return 'ExplainResponse(topic: $topic, elements: $elements)';
}


}

/// @nodoc
abstract mixin class _$ExplainResponseCopyWith<$Res> implements $ExplainResponseCopyWith<$Res> {
  factory _$ExplainResponseCopyWith(_ExplainResponse value, $Res Function(_ExplainResponse) _then) = __$ExplainResponseCopyWithImpl;
@override @useResult
$Res call({
 String topic, List<MathElement> elements
});




}
/// @nodoc
class __$ExplainResponseCopyWithImpl<$Res>
    implements _$ExplainResponseCopyWith<$Res> {
  __$ExplainResponseCopyWithImpl(this._self, this._then);

  final _ExplainResponse _self;
  final $Res Function(_ExplainResponse) _then;

/// Create a copy of ExplainResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? elements = null,}) {
  return _then(_ExplainResponse(
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
                case 'formula':
          return _Formula.fromJson(
            json
          );
                case 'example_steps':
          return _ExampleSteps.fromJson(
            json
          );
                case 'answer_block':
          return _AnswerBlock.fromJson(
            json
          );
                case 'bar_chart':
          return _BarChart.fromJson(
            json
          );
                case 'line_chart':
          return _LineChart.fromJson(
            json
          );
                case 'long_division':
          return _LongDivision.fromJson(
            json
          );
                case 'life_cycle':
          return _LifeCycle.fromJson(
            json
          );
                case 'node_graph':
          return _NodeGraph.fromJson(
            json
          );
                case 'hex_steps':
          return _HexSteps.fromJson(
            json
          );
                case 'horizontal_blocks':
          return _HorizontalBlocks.fromJson(
            json
          );
                case 'pyramid':
          return _Pyramid.fromJson(
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

 String get id; int get order; String? get title; String? get caption;
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
 String id, int order, String? title, String? caption
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TextBlock value)?  text_block,TResult Function( _Formula value)?  formula,TResult Function( _ExampleSteps value)?  example_steps,TResult Function( _AnswerBlock value)?  answer_block,TResult Function( _BarChart value)?  bar_chart,TResult Function( _LineChart value)?  line_chart,TResult Function( _LongDivision value)?  long_division,TResult Function( _LifeCycle value)?  life_cycle,TResult Function( _NodeGraph value)?  node_graph,TResult Function( _HexSteps value)?  hex_steps,TResult Function( _HorizontalBlocks value)?  horizontal_blocks,TResult Function( _Pyramid value)?  pyramid,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextBlock() when text_block != null:
return text_block(_that);case _Formula() when formula != null:
return formula(_that);case _ExampleSteps() when example_steps != null:
return example_steps(_that);case _AnswerBlock() when answer_block != null:
return answer_block(_that);case _BarChart() when bar_chart != null:
return bar_chart(_that);case _LineChart() when line_chart != null:
return line_chart(_that);case _LongDivision() when long_division != null:
return long_division(_that);case _LifeCycle() when life_cycle != null:
return life_cycle(_that);case _NodeGraph() when node_graph != null:
return node_graph(_that);case _HexSteps() when hex_steps != null:
return hex_steps(_that);case _HorizontalBlocks() when horizontal_blocks != null:
return horizontal_blocks(_that);case _Pyramid() when pyramid != null:
return pyramid(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TextBlock value)  text_block,required TResult Function( _Formula value)  formula,required TResult Function( _ExampleSteps value)  example_steps,required TResult Function( _AnswerBlock value)  answer_block,required TResult Function( _BarChart value)  bar_chart,required TResult Function( _LineChart value)  line_chart,required TResult Function( _LongDivision value)  long_division,required TResult Function( _LifeCycle value)  life_cycle,required TResult Function( _NodeGraph value)  node_graph,required TResult Function( _HexSteps value)  hex_steps,required TResult Function( _HorizontalBlocks value)  horizontal_blocks,required TResult Function( _Pyramid value)  pyramid,}){
final _that = this;
switch (_that) {
case _TextBlock():
return text_block(_that);case _Formula():
return formula(_that);case _ExampleSteps():
return example_steps(_that);case _AnswerBlock():
return answer_block(_that);case _BarChart():
return bar_chart(_that);case _LineChart():
return line_chart(_that);case _LongDivision():
return long_division(_that);case _LifeCycle():
return life_cycle(_that);case _NodeGraph():
return node_graph(_that);case _HexSteps():
return hex_steps(_that);case _HorizontalBlocks():
return horizontal_blocks(_that);case _Pyramid():
return pyramid(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TextBlock value)?  text_block,TResult? Function( _Formula value)?  formula,TResult? Function( _ExampleSteps value)?  example_steps,TResult? Function( _AnswerBlock value)?  answer_block,TResult? Function( _BarChart value)?  bar_chart,TResult? Function( _LineChart value)?  line_chart,TResult? Function( _LongDivision value)?  long_division,TResult? Function( _LifeCycle value)?  life_cycle,TResult? Function( _NodeGraph value)?  node_graph,TResult? Function( _HexSteps value)?  hex_steps,TResult? Function( _HorizontalBlocks value)?  horizontal_blocks,TResult? Function( _Pyramid value)?  pyramid,}){
final _that = this;
switch (_that) {
case _TextBlock() when text_block != null:
return text_block(_that);case _Formula() when formula != null:
return formula(_that);case _ExampleSteps() when example_steps != null:
return example_steps(_that);case _AnswerBlock() when answer_block != null:
return answer_block(_that);case _BarChart() when bar_chart != null:
return bar_chart(_that);case _LineChart() when line_chart != null:
return line_chart(_that);case _LongDivision() when long_division != null:
return long_division(_that);case _LifeCycle() when life_cycle != null:
return life_cycle(_that);case _NodeGraph() when node_graph != null:
return node_graph(_that);case _HexSteps() when hex_steps != null:
return hex_steps(_that);case _HorizontalBlocks() when horizontal_blocks != null:
return horizontal_blocks(_that);case _Pyramid() when pyramid != null:
return pyramid(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  int order,  String? title,  String? caption,  String text)?  text_block,TResult Function( String id,  int order,  String? title,  String? caption,  String? latex,  String? text)?  formula,TResult Function( String id,  int order,  String? title,  String? caption,  List<StepDetail> steps)?  example_steps,TResult Function( String id,  int order,  String? title,  String? caption,  String answer,  String? explanation)?  answer_block,TResult Function( String id,  int order,  String? title,  String? caption,  List<double> data,  List<String> labels, @JsonKey(name: 'image_base64')  String imageBase64)?  bar_chart,TResult Function( String id,  int order,  String? title,  String? caption,  List<double> x,  List<double> y, @JsonKey(name: 'image_base64')  String imageBase64)?  line_chart,TResult Function( String id,  int order,  String? title,  String? caption,  int dividend,  int divisor,  List<LongDivisionStep> steps)?  long_division,TResult Function( String id,  int order,  String? title,  String? caption,  List<String> stages)?  life_cycle,TResult Function( String id,  int order,  String? title,  String? caption,  List<GraphNode> nodes,  List<GraphEdge> edges)?  node_graph,TResult Function( String id,  int order,  String? title,  String? caption,  List<String> items)?  hex_steps,TResult Function( String id,  int order,  String? title,  String? caption,  List<HorizontalItem> items)?  horizontal_blocks,TResult Function( String id,  int order,  String? title,  String? caption,  List<List<String>> levels)?  pyramid,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextBlock() when text_block != null:
return text_block(_that.id,_that.order,_that.title,_that.caption,_that.text);case _Formula() when formula != null:
return formula(_that.id,_that.order,_that.title,_that.caption,_that.latex,_that.text);case _ExampleSteps() when example_steps != null:
return example_steps(_that.id,_that.order,_that.title,_that.caption,_that.steps);case _AnswerBlock() when answer_block != null:
return answer_block(_that.id,_that.order,_that.title,_that.caption,_that.answer,_that.explanation);case _BarChart() when bar_chart != null:
return bar_chart(_that.id,_that.order,_that.title,_that.caption,_that.data,_that.labels,_that.imageBase64);case _LineChart() when line_chart != null:
return line_chart(_that.id,_that.order,_that.title,_that.caption,_that.x,_that.y,_that.imageBase64);case _LongDivision() when long_division != null:
return long_division(_that.id,_that.order,_that.title,_that.caption,_that.dividend,_that.divisor,_that.steps);case _LifeCycle() when life_cycle != null:
return life_cycle(_that.id,_that.order,_that.title,_that.caption,_that.stages);case _NodeGraph() when node_graph != null:
return node_graph(_that.id,_that.order,_that.title,_that.caption,_that.nodes,_that.edges);case _HexSteps() when hex_steps != null:
return hex_steps(_that.id,_that.order,_that.title,_that.caption,_that.items);case _HorizontalBlocks() when horizontal_blocks != null:
return horizontal_blocks(_that.id,_that.order,_that.title,_that.caption,_that.items);case _Pyramid() when pyramid != null:
return pyramid(_that.id,_that.order,_that.title,_that.caption,_that.levels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  int order,  String? title,  String? caption,  String text)  text_block,required TResult Function( String id,  int order,  String? title,  String? caption,  String? latex,  String? text)  formula,required TResult Function( String id,  int order,  String? title,  String? caption,  List<StepDetail> steps)  example_steps,required TResult Function( String id,  int order,  String? title,  String? caption,  String answer,  String? explanation)  answer_block,required TResult Function( String id,  int order,  String? title,  String? caption,  List<double> data,  List<String> labels, @JsonKey(name: 'image_base64')  String imageBase64)  bar_chart,required TResult Function( String id,  int order,  String? title,  String? caption,  List<double> x,  List<double> y, @JsonKey(name: 'image_base64')  String imageBase64)  line_chart,required TResult Function( String id,  int order,  String? title,  String? caption,  int dividend,  int divisor,  List<LongDivisionStep> steps)  long_division,required TResult Function( String id,  int order,  String? title,  String? caption,  List<String> stages)  life_cycle,required TResult Function( String id,  int order,  String? title,  String? caption,  List<GraphNode> nodes,  List<GraphEdge> edges)  node_graph,required TResult Function( String id,  int order,  String? title,  String? caption,  List<String> items)  hex_steps,required TResult Function( String id,  int order,  String? title,  String? caption,  List<HorizontalItem> items)  horizontal_blocks,required TResult Function( String id,  int order,  String? title,  String? caption,  List<List<String>> levels)  pyramid,}) {final _that = this;
switch (_that) {
case _TextBlock():
return text_block(_that.id,_that.order,_that.title,_that.caption,_that.text);case _Formula():
return formula(_that.id,_that.order,_that.title,_that.caption,_that.latex,_that.text);case _ExampleSteps():
return example_steps(_that.id,_that.order,_that.title,_that.caption,_that.steps);case _AnswerBlock():
return answer_block(_that.id,_that.order,_that.title,_that.caption,_that.answer,_that.explanation);case _BarChart():
return bar_chart(_that.id,_that.order,_that.title,_that.caption,_that.data,_that.labels,_that.imageBase64);case _LineChart():
return line_chart(_that.id,_that.order,_that.title,_that.caption,_that.x,_that.y,_that.imageBase64);case _LongDivision():
return long_division(_that.id,_that.order,_that.title,_that.caption,_that.dividend,_that.divisor,_that.steps);case _LifeCycle():
return life_cycle(_that.id,_that.order,_that.title,_that.caption,_that.stages);case _NodeGraph():
return node_graph(_that.id,_that.order,_that.title,_that.caption,_that.nodes,_that.edges);case _HexSteps():
return hex_steps(_that.id,_that.order,_that.title,_that.caption,_that.items);case _HorizontalBlocks():
return horizontal_blocks(_that.id,_that.order,_that.title,_that.caption,_that.items);case _Pyramid():
return pyramid(_that.id,_that.order,_that.title,_that.caption,_that.levels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  int order,  String? title,  String? caption,  String text)?  text_block,TResult? Function( String id,  int order,  String? title,  String? caption,  String? latex,  String? text)?  formula,TResult? Function( String id,  int order,  String? title,  String? caption,  List<StepDetail> steps)?  example_steps,TResult? Function( String id,  int order,  String? title,  String? caption,  String answer,  String? explanation)?  answer_block,TResult? Function( String id,  int order,  String? title,  String? caption,  List<double> data,  List<String> labels, @JsonKey(name: 'image_base64')  String imageBase64)?  bar_chart,TResult? Function( String id,  int order,  String? title,  String? caption,  List<double> x,  List<double> y, @JsonKey(name: 'image_base64')  String imageBase64)?  line_chart,TResult? Function( String id,  int order,  String? title,  String? caption,  int dividend,  int divisor,  List<LongDivisionStep> steps)?  long_division,TResult? Function( String id,  int order,  String? title,  String? caption,  List<String> stages)?  life_cycle,TResult? Function( String id,  int order,  String? title,  String? caption,  List<GraphNode> nodes,  List<GraphEdge> edges)?  node_graph,TResult? Function( String id,  int order,  String? title,  String? caption,  List<String> items)?  hex_steps,TResult? Function( String id,  int order,  String? title,  String? caption,  List<HorizontalItem> items)?  horizontal_blocks,TResult? Function( String id,  int order,  String? title,  String? caption,  List<List<String>> levels)?  pyramid,}) {final _that = this;
switch (_that) {
case _TextBlock() when text_block != null:
return text_block(_that.id,_that.order,_that.title,_that.caption,_that.text);case _Formula() when formula != null:
return formula(_that.id,_that.order,_that.title,_that.caption,_that.latex,_that.text);case _ExampleSteps() when example_steps != null:
return example_steps(_that.id,_that.order,_that.title,_that.caption,_that.steps);case _AnswerBlock() when answer_block != null:
return answer_block(_that.id,_that.order,_that.title,_that.caption,_that.answer,_that.explanation);case _BarChart() when bar_chart != null:
return bar_chart(_that.id,_that.order,_that.title,_that.caption,_that.data,_that.labels,_that.imageBase64);case _LineChart() when line_chart != null:
return line_chart(_that.id,_that.order,_that.title,_that.caption,_that.x,_that.y,_that.imageBase64);case _LongDivision() when long_division != null:
return long_division(_that.id,_that.order,_that.title,_that.caption,_that.dividend,_that.divisor,_that.steps);case _LifeCycle() when life_cycle != null:
return life_cycle(_that.id,_that.order,_that.title,_that.caption,_that.stages);case _NodeGraph() when node_graph != null:
return node_graph(_that.id,_that.order,_that.title,_that.caption,_that.nodes,_that.edges);case _HexSteps() when hex_steps != null:
return hex_steps(_that.id,_that.order,_that.title,_that.caption,_that.items);case _HorizontalBlocks() when horizontal_blocks != null:
return horizontal_blocks(_that.id,_that.order,_that.title,_that.caption,_that.items);case _Pyramid() when pyramid != null:
return pyramid(_that.id,_that.order,_that.title,_that.caption,_that.levels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextBlock implements MathElement {
  const _TextBlock({required this.id, required this.order, this.title, this.caption, required this.text, final  String? $type}): $type = $type ?? 'text_block';
  factory _TextBlock.fromJson(Map<String, dynamic> json) => _$TextBlockFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
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
 String id, int order, String? title, String? caption, String text
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? text = null,}) {
  return _then(_TextBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _Formula implements MathElement {
  const _Formula({required this.id, required this.order, this.title, this.caption, this.latex, this.text, final  String? $type}): $type = $type ?? 'formula';
  factory _Formula.fromJson(Map<String, dynamic> json) => _$FormulaFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  String? latex;
 final  String? text;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaCopyWith<_Formula> get copyWith => __$FormulaCopyWithImpl<_Formula>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Formula&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.latex, latex) || other.latex == latex)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,latex,text);

@override
String toString() {
  return 'MathElement.formula(id: $id, order: $order, title: $title, caption: $caption, latex: $latex, text: $text)';
}


}

/// @nodoc
abstract mixin class _$FormulaCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$FormulaCopyWith(_Formula value, $Res Function(_Formula) _then) = __$FormulaCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? title, String? caption, String? latex, String? text
});




}
/// @nodoc
class __$FormulaCopyWithImpl<$Res>
    implements _$FormulaCopyWith<$Res> {
  __$FormulaCopyWithImpl(this._self, this._then);

  final _Formula _self;
  final $Res Function(_Formula) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? latex = freezed,Object? text = freezed,}) {
  return _then(_Formula(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,latex: freezed == latex ? _self.latex : latex // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ExampleSteps implements MathElement {
  const _ExampleSteps({required this.id, required this.order, this.title, this.caption, required final  List<StepDetail> steps, final  String? $type}): _steps = steps,$type = $type ?? 'example_steps';
  factory _ExampleSteps.fromJson(Map<String, dynamic> json) => _$ExampleStepsFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  List<StepDetail> _steps;
 List<StepDetail> get steps {
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
 String id, int order, String? title, String? caption, List<StepDetail> steps
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? steps = null,}) {
  return _then(_ExampleSteps(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepDetail>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _AnswerBlock implements MathElement {
  const _AnswerBlock({required this.id, required this.order, this.title, this.caption, required this.answer, this.explanation, final  String? $type}): $type = $type ?? 'answer_block';
  factory _AnswerBlock.fromJson(Map<String, dynamic> json) => _$AnswerBlockFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  String answer;
 final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerBlockCopyWith<_AnswerBlock> get copyWith => __$AnswerBlockCopyWithImpl<_AnswerBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswerBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerBlock&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,answer,explanation);

@override
String toString() {
  return 'MathElement.answer_block(id: $id, order: $order, title: $title, caption: $caption, answer: $answer, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$AnswerBlockCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$AnswerBlockCopyWith(_AnswerBlock value, $Res Function(_AnswerBlock) _then) = __$AnswerBlockCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? title, String? caption, String answer, String? explanation
});




}
/// @nodoc
class __$AnswerBlockCopyWithImpl<$Res>
    implements _$AnswerBlockCopyWith<$Res> {
  __$AnswerBlockCopyWithImpl(this._self, this._then);

  final _AnswerBlock _self;
  final $Res Function(_AnswerBlock) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? answer = null,Object? explanation = freezed,}) {
  return _then(_AnswerBlock(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _BarChart implements MathElement {
  const _BarChart({required this.id, required this.order, this.title, this.caption, required final  List<double> data, required final  List<String> labels, @JsonKey(name: 'image_base64') required this.imageBase64, final  String? $type}): _data = data,_labels = labels,$type = $type ?? 'bar_chart';
  factory _BarChart.fromJson(Map<String, dynamic> json) => _$BarChartFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
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

@JsonKey(name: 'image_base64') final  String imageBase64;

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
 String id, int order, String? title, String? caption, List<double> data, List<String> labels,@JsonKey(name: 'image_base64') String imageBase64
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? data = null,Object? labels = null,Object? imageBase64 = null,}) {
  return _then(_BarChart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<double>,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,imageBase64: null == imageBase64 ? _self.imageBase64 : imageBase64 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _LineChart implements MathElement {
  const _LineChart({required this.id, required this.order, this.title, this.caption, required final  List<double> x, required final  List<double> y, @JsonKey(name: 'image_base64') required this.imageBase64, final  String? $type}): _x = x,_y = y,$type = $type ?? 'line_chart';
  factory _LineChart.fromJson(Map<String, dynamic> json) => _$LineChartFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  List<double> _x;
 List<double> get x {
  if (_x is EqualUnmodifiableListView) return _x;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_x);
}

 final  List<double> _y;
 List<double> get y {
  if (_y is EqualUnmodifiableListView) return _y;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_y);
}

@JsonKey(name: 'image_base64') final  String imageBase64;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineChartCopyWith<_LineChart> get copyWith => __$LineChartCopyWithImpl<_LineChart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LineChartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineChart&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._x, _x)&&const DeepCollectionEquality().equals(other._y, _y)&&(identical(other.imageBase64, imageBase64) || other.imageBase64 == imageBase64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,const DeepCollectionEquality().hash(_x),const DeepCollectionEquality().hash(_y),imageBase64);

@override
String toString() {
  return 'MathElement.line_chart(id: $id, order: $order, title: $title, caption: $caption, x: $x, y: $y, imageBase64: $imageBase64)';
}


}

/// @nodoc
abstract mixin class _$LineChartCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$LineChartCopyWith(_LineChart value, $Res Function(_LineChart) _then) = __$LineChartCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? title, String? caption, List<double> x, List<double> y,@JsonKey(name: 'image_base64') String imageBase64
});




}
/// @nodoc
class __$LineChartCopyWithImpl<$Res>
    implements _$LineChartCopyWith<$Res> {
  __$LineChartCopyWithImpl(this._self, this._then);

  final _LineChart _self;
  final $Res Function(_LineChart) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? x = null,Object? y = null,Object? imageBase64 = null,}) {
  return _then(_LineChart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,x: null == x ? _self._x : x // ignore: cast_nullable_to_non_nullable
as List<double>,y: null == y ? _self._y : y // ignore: cast_nullable_to_non_nullable
as List<double>,imageBase64: null == imageBase64 ? _self.imageBase64 : imageBase64 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _LongDivision implements MathElement {
  const _LongDivision({required this.id, required this.order, this.title, this.caption, required this.dividend, required this.divisor, required final  List<LongDivisionStep> steps, final  String? $type}): _steps = steps,$type = $type ?? 'long_division';
  factory _LongDivision.fromJson(Map<String, dynamic> json) => _$LongDivisionFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  int dividend;
 final  int divisor;
 final  List<LongDivisionStep> _steps;
 List<LongDivisionStep> get steps {
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
_$LongDivisionCopyWith<_LongDivision> get copyWith => __$LongDivisionCopyWithImpl<_LongDivision>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LongDivisionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LongDivision&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.dividend, dividend) || other.dividend == dividend)&&(identical(other.divisor, divisor) || other.divisor == divisor)&&const DeepCollectionEquality().equals(other._steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,dividend,divisor,const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'MathElement.long_division(id: $id, order: $order, title: $title, caption: $caption, dividend: $dividend, divisor: $divisor, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$LongDivisionCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$LongDivisionCopyWith(_LongDivision value, $Res Function(_LongDivision) _then) = __$LongDivisionCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? title, String? caption, int dividend, int divisor, List<LongDivisionStep> steps
});




}
/// @nodoc
class __$LongDivisionCopyWithImpl<$Res>
    implements _$LongDivisionCopyWith<$Res> {
  __$LongDivisionCopyWithImpl(this._self, this._then);

  final _LongDivision _self;
  final $Res Function(_LongDivision) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? dividend = null,Object? divisor = null,Object? steps = null,}) {
  return _then(_LongDivision(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,dividend: null == dividend ? _self.dividend : dividend // ignore: cast_nullable_to_non_nullable
as int,divisor: null == divisor ? _self.divisor : divisor // ignore: cast_nullable_to_non_nullable
as int,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<LongDivisionStep>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _LifeCycle implements MathElement {
  const _LifeCycle({required this.id, required this.order, this.title, this.caption, required final  List<String> stages, final  String? $type}): _stages = stages,$type = $type ?? 'life_cycle';
  factory _LifeCycle.fromJson(Map<String, dynamic> json) => _$LifeCycleFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  List<String> _stages;
 List<String> get stages {
  if (_stages is EqualUnmodifiableListView) return _stages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stages);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LifeCycleCopyWith<_LifeCycle> get copyWith => __$LifeCycleCopyWithImpl<_LifeCycle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LifeCycleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LifeCycle&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._stages, _stages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,const DeepCollectionEquality().hash(_stages));

@override
String toString() {
  return 'MathElement.life_cycle(id: $id, order: $order, title: $title, caption: $caption, stages: $stages)';
}


}

/// @nodoc
abstract mixin class _$LifeCycleCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$LifeCycleCopyWith(_LifeCycle value, $Res Function(_LifeCycle) _then) = __$LifeCycleCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? title, String? caption, List<String> stages
});




}
/// @nodoc
class __$LifeCycleCopyWithImpl<$Res>
    implements _$LifeCycleCopyWith<$Res> {
  __$LifeCycleCopyWithImpl(this._self, this._then);

  final _LifeCycle _self;
  final $Res Function(_LifeCycle) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? stages = null,}) {
  return _then(_LifeCycle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,stages: null == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _NodeGraph implements MathElement {
  const _NodeGraph({required this.id, required this.order, this.title, this.caption, required final  List<GraphNode> nodes, required final  List<GraphEdge> edges, final  String? $type}): _nodes = nodes,_edges = edges,$type = $type ?? 'node_graph';
  factory _NodeGraph.fromJson(Map<String, dynamic> json) => _$NodeGraphFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  List<GraphNode> _nodes;
 List<GraphNode> get nodes {
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nodes);
}

 final  List<GraphEdge> _edges;
 List<GraphEdge> get edges {
  if (_edges is EqualUnmodifiableListView) return _edges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_edges);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeGraphCopyWith<_NodeGraph> get copyWith => __$NodeGraphCopyWithImpl<_NodeGraph>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NodeGraphToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeGraph&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._nodes, _nodes)&&const DeepCollectionEquality().equals(other._edges, _edges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,const DeepCollectionEquality().hash(_nodes),const DeepCollectionEquality().hash(_edges));

@override
String toString() {
  return 'MathElement.node_graph(id: $id, order: $order, title: $title, caption: $caption, nodes: $nodes, edges: $edges)';
}


}

/// @nodoc
abstract mixin class _$NodeGraphCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$NodeGraphCopyWith(_NodeGraph value, $Res Function(_NodeGraph) _then) = __$NodeGraphCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? title, String? caption, List<GraphNode> nodes, List<GraphEdge> edges
});




}
/// @nodoc
class __$NodeGraphCopyWithImpl<$Res>
    implements _$NodeGraphCopyWith<$Res> {
  __$NodeGraphCopyWithImpl(this._self, this._then);

  final _NodeGraph _self;
  final $Res Function(_NodeGraph) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? nodes = null,Object? edges = null,}) {
  return _then(_NodeGraph(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,nodes: null == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<GraphNode>,edges: null == edges ? _self._edges : edges // ignore: cast_nullable_to_non_nullable
as List<GraphEdge>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _HexSteps implements MathElement {
  const _HexSteps({required this.id, required this.order, this.title, this.caption, required final  List<String> items, final  String? $type}): _items = items,$type = $type ?? 'hex_steps';
  factory _HexSteps.fromJson(Map<String, dynamic> json) => _$HexStepsFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  List<String> _items;
 List<String> get items {
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
_$HexStepsCopyWith<_HexSteps> get copyWith => __$HexStepsCopyWithImpl<_HexSteps>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HexStepsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HexSteps&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MathElement.hex_steps(id: $id, order: $order, title: $title, caption: $caption, items: $items)';
}


}

/// @nodoc
abstract mixin class _$HexStepsCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$HexStepsCopyWith(_HexSteps value, $Res Function(_HexSteps) _then) = __$HexStepsCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? title, String? caption, List<String> items
});




}
/// @nodoc
class __$HexStepsCopyWithImpl<$Res>
    implements _$HexStepsCopyWith<$Res> {
  __$HexStepsCopyWithImpl(this._self, this._then);

  final _HexSteps _self;
  final $Res Function(_HexSteps) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? items = null,}) {
  return _then(_HexSteps(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _HorizontalBlocks implements MathElement {
  const _HorizontalBlocks({required this.id, required this.order, this.title, this.caption, required final  List<HorizontalItem> items, final  String? $type}): _items = items,$type = $type ?? 'horizontal_blocks';
  factory _HorizontalBlocks.fromJson(Map<String, dynamic> json) => _$HorizontalBlocksFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
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
 String id, int order, String? title, String? caption, List<HorizontalItem> items
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? items = null,}) {
  return _then(_HorizontalBlocks(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<HorizontalItem>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _Pyramid implements MathElement {
  const _Pyramid({required this.id, required this.order, this.title, this.caption, required final  List<List<String>> levels, final  String? $type}): _levels = levels,$type = $type ?? 'pyramid';
  factory _Pyramid.fromJson(Map<String, dynamic> json) => _$PyramidFromJson(json);

@override final  String id;
@override final  int order;
@override final  String? title;
@override final  String? caption;
 final  List<List<String>> _levels;
 List<List<String>> get levels {
  if (_levels is EqualUnmodifiableListView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_levels);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PyramidCopyWith<_Pyramid> get copyWith => __$PyramidCopyWithImpl<_Pyramid>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PyramidToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pyramid&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.title, title) || other.title == title)&&(identical(other.caption, caption) || other.caption == caption)&&const DeepCollectionEquality().equals(other._levels, _levels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,title,caption,const DeepCollectionEquality().hash(_levels));

@override
String toString() {
  return 'MathElement.pyramid(id: $id, order: $order, title: $title, caption: $caption, levels: $levels)';
}


}

/// @nodoc
abstract mixin class _$PyramidCopyWith<$Res> implements $MathElementCopyWith<$Res> {
  factory _$PyramidCopyWith(_Pyramid value, $Res Function(_Pyramid) _then) = __$PyramidCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? title, String? caption, List<List<String>> levels
});




}
/// @nodoc
class __$PyramidCopyWithImpl<$Res>
    implements _$PyramidCopyWith<$Res> {
  __$PyramidCopyWithImpl(this._self, this._then);

  final _Pyramid _self;
  final $Res Function(_Pyramid) _then;

/// Create a copy of MathElement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? title = freezed,Object? caption = freezed,Object? levels = null,}) {
  return _then(_Pyramid(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,levels: null == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as List<List<String>>,
  ));
}


}


/// @nodoc
mixin _$StepDetail {

@JsonKey(name: 'step_num') int get stepNum;@JsonKey(name: 'step_text') String get stepText;
/// Create a copy of StepDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepDetailCopyWith<StepDetail> get copyWith => _$StepDetailCopyWithImpl<StepDetail>(this as StepDetail, _$identity);

  /// Serializes this StepDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepDetail&&(identical(other.stepNum, stepNum) || other.stepNum == stepNum)&&(identical(other.stepText, stepText) || other.stepText == stepText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepNum,stepText);

@override
String toString() {
  return 'StepDetail(stepNum: $stepNum, stepText: $stepText)';
}


}

/// @nodoc
abstract mixin class $StepDetailCopyWith<$Res>  {
  factory $StepDetailCopyWith(StepDetail value, $Res Function(StepDetail) _then) = _$StepDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'step_num') int stepNum,@JsonKey(name: 'step_text') String stepText
});




}
/// @nodoc
class _$StepDetailCopyWithImpl<$Res>
    implements $StepDetailCopyWith<$Res> {
  _$StepDetailCopyWithImpl(this._self, this._then);

  final StepDetail _self;
  final $Res Function(StepDetail) _then;

/// Create a copy of StepDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepNum = null,Object? stepText = null,}) {
  return _then(_self.copyWith(
stepNum: null == stepNum ? _self.stepNum : stepNum // ignore: cast_nullable_to_non_nullable
as int,stepText: null == stepText ? _self.stepText : stepText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StepDetail].
extension StepDetailPatterns on StepDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepDetail value)  $default,){
final _that = this;
switch (_that) {
case _StepDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepDetail value)?  $default,){
final _that = this;
switch (_that) {
case _StepDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'step_num')  int stepNum, @JsonKey(name: 'step_text')  String stepText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepDetail() when $default != null:
return $default(_that.stepNum,_that.stepText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'step_num')  int stepNum, @JsonKey(name: 'step_text')  String stepText)  $default,) {final _that = this;
switch (_that) {
case _StepDetail():
return $default(_that.stepNum,_that.stepText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'step_num')  int stepNum, @JsonKey(name: 'step_text')  String stepText)?  $default,) {final _that = this;
switch (_that) {
case _StepDetail() when $default != null:
return $default(_that.stepNum,_that.stepText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StepDetail implements StepDetail {
  const _StepDetail({@JsonKey(name: 'step_num') required this.stepNum, @JsonKey(name: 'step_text') required this.stepText});
  factory _StepDetail.fromJson(Map<String, dynamic> json) => _$StepDetailFromJson(json);

@override@JsonKey(name: 'step_num') final  int stepNum;
@override@JsonKey(name: 'step_text') final  String stepText;

/// Create a copy of StepDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepDetailCopyWith<_StepDetail> get copyWith => __$StepDetailCopyWithImpl<_StepDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StepDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepDetail&&(identical(other.stepNum, stepNum) || other.stepNum == stepNum)&&(identical(other.stepText, stepText) || other.stepText == stepText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stepNum,stepText);

@override
String toString() {
  return 'StepDetail(stepNum: $stepNum, stepText: $stepText)';
}


}

/// @nodoc
abstract mixin class _$StepDetailCopyWith<$Res> implements $StepDetailCopyWith<$Res> {
  factory _$StepDetailCopyWith(_StepDetail value, $Res Function(_StepDetail) _then) = __$StepDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'step_num') int stepNum,@JsonKey(name: 'step_text') String stepText
});




}
/// @nodoc
class __$StepDetailCopyWithImpl<$Res>
    implements _$StepDetailCopyWith<$Res> {
  __$StepDetailCopyWithImpl(this._self, this._then);

  final _StepDetail _self;
  final $Res Function(_StepDetail) _then;

/// Create a copy of StepDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepNum = null,Object? stepText = null,}) {
  return _then(_StepDetail(
stepNum: null == stepNum ? _self.stepNum : stepNum // ignore: cast_nullable_to_non_nullable
as int,stepText: null == stepText ? _self.stepText : stepText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LongDivisionStep {

@JsonKey(name: 'quotient_digit') int get quotientDigit;@JsonKey(name: 'partial_product') int get partialProduct; int get remainder;
/// Create a copy of LongDivisionStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LongDivisionStepCopyWith<LongDivisionStep> get copyWith => _$LongDivisionStepCopyWithImpl<LongDivisionStep>(this as LongDivisionStep, _$identity);

  /// Serializes this LongDivisionStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LongDivisionStep&&(identical(other.quotientDigit, quotientDigit) || other.quotientDigit == quotientDigit)&&(identical(other.partialProduct, partialProduct) || other.partialProduct == partialProduct)&&(identical(other.remainder, remainder) || other.remainder == remainder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quotientDigit,partialProduct,remainder);

@override
String toString() {
  return 'LongDivisionStep(quotientDigit: $quotientDigit, partialProduct: $partialProduct, remainder: $remainder)';
}


}

/// @nodoc
abstract mixin class $LongDivisionStepCopyWith<$Res>  {
  factory $LongDivisionStepCopyWith(LongDivisionStep value, $Res Function(LongDivisionStep) _then) = _$LongDivisionStepCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'quotient_digit') int quotientDigit,@JsonKey(name: 'partial_product') int partialProduct, int remainder
});




}
/// @nodoc
class _$LongDivisionStepCopyWithImpl<$Res>
    implements $LongDivisionStepCopyWith<$Res> {
  _$LongDivisionStepCopyWithImpl(this._self, this._then);

  final LongDivisionStep _self;
  final $Res Function(LongDivisionStep) _then;

/// Create a copy of LongDivisionStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quotientDigit = null,Object? partialProduct = null,Object? remainder = null,}) {
  return _then(_self.copyWith(
quotientDigit: null == quotientDigit ? _self.quotientDigit : quotientDigit // ignore: cast_nullable_to_non_nullable
as int,partialProduct: null == partialProduct ? _self.partialProduct : partialProduct // ignore: cast_nullable_to_non_nullable
as int,remainder: null == remainder ? _self.remainder : remainder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LongDivisionStep].
extension LongDivisionStepPatterns on LongDivisionStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LongDivisionStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LongDivisionStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LongDivisionStep value)  $default,){
final _that = this;
switch (_that) {
case _LongDivisionStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LongDivisionStep value)?  $default,){
final _that = this;
switch (_that) {
case _LongDivisionStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'quotient_digit')  int quotientDigit, @JsonKey(name: 'partial_product')  int partialProduct,  int remainder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LongDivisionStep() when $default != null:
return $default(_that.quotientDigit,_that.partialProduct,_that.remainder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'quotient_digit')  int quotientDigit, @JsonKey(name: 'partial_product')  int partialProduct,  int remainder)  $default,) {final _that = this;
switch (_that) {
case _LongDivisionStep():
return $default(_that.quotientDigit,_that.partialProduct,_that.remainder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'quotient_digit')  int quotientDigit, @JsonKey(name: 'partial_product')  int partialProduct,  int remainder)?  $default,) {final _that = this;
switch (_that) {
case _LongDivisionStep() when $default != null:
return $default(_that.quotientDigit,_that.partialProduct,_that.remainder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LongDivisionStep implements LongDivisionStep {
  const _LongDivisionStep({@JsonKey(name: 'quotient_digit') required this.quotientDigit, @JsonKey(name: 'partial_product') required this.partialProduct, required this.remainder});
  factory _LongDivisionStep.fromJson(Map<String, dynamic> json) => _$LongDivisionStepFromJson(json);

@override@JsonKey(name: 'quotient_digit') final  int quotientDigit;
@override@JsonKey(name: 'partial_product') final  int partialProduct;
@override final  int remainder;

/// Create a copy of LongDivisionStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LongDivisionStepCopyWith<_LongDivisionStep> get copyWith => __$LongDivisionStepCopyWithImpl<_LongDivisionStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LongDivisionStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LongDivisionStep&&(identical(other.quotientDigit, quotientDigit) || other.quotientDigit == quotientDigit)&&(identical(other.partialProduct, partialProduct) || other.partialProduct == partialProduct)&&(identical(other.remainder, remainder) || other.remainder == remainder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quotientDigit,partialProduct,remainder);

@override
String toString() {
  return 'LongDivisionStep(quotientDigit: $quotientDigit, partialProduct: $partialProduct, remainder: $remainder)';
}


}

/// @nodoc
abstract mixin class _$LongDivisionStepCopyWith<$Res> implements $LongDivisionStepCopyWith<$Res> {
  factory _$LongDivisionStepCopyWith(_LongDivisionStep value, $Res Function(_LongDivisionStep) _then) = __$LongDivisionStepCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'quotient_digit') int quotientDigit,@JsonKey(name: 'partial_product') int partialProduct, int remainder
});




}
/// @nodoc
class __$LongDivisionStepCopyWithImpl<$Res>
    implements _$LongDivisionStepCopyWith<$Res> {
  __$LongDivisionStepCopyWithImpl(this._self, this._then);

  final _LongDivisionStep _self;
  final $Res Function(_LongDivisionStep) _then;

/// Create a copy of LongDivisionStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quotientDigit = null,Object? partialProduct = null,Object? remainder = null,}) {
  return _then(_LongDivisionStep(
quotientDigit: null == quotientDigit ? _self.quotientDigit : quotientDigit // ignore: cast_nullable_to_non_nullable
as int,partialProduct: null == partialProduct ? _self.partialProduct : partialProduct // ignore: cast_nullable_to_non_nullable
as int,remainder: null == remainder ? _self.remainder : remainder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GraphNode {

 String get id; String get label;
/// Create a copy of GraphNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphNodeCopyWith<GraphNode> get copyWith => _$GraphNodeCopyWithImpl<GraphNode>(this as GraphNode, _$identity);

  /// Serializes this GraphNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphNode&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label);

@override
String toString() {
  return 'GraphNode(id: $id, label: $label)';
}


}

/// @nodoc
abstract mixin class $GraphNodeCopyWith<$Res>  {
  factory $GraphNodeCopyWith(GraphNode value, $Res Function(GraphNode) _then) = _$GraphNodeCopyWithImpl;
@useResult
$Res call({
 String id, String label
});




}
/// @nodoc
class _$GraphNodeCopyWithImpl<$Res>
    implements $GraphNodeCopyWith<$Res> {
  _$GraphNodeCopyWithImpl(this._self, this._then);

  final GraphNode _self;
  final $Res Function(GraphNode) _then;

/// Create a copy of GraphNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphNode].
extension GraphNodePatterns on GraphNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphNode value)  $default,){
final _that = this;
switch (_that) {
case _GraphNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphNode value)?  $default,){
final _that = this;
switch (_that) {
case _GraphNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphNode() when $default != null:
return $default(_that.id,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label)  $default,) {final _that = this;
switch (_that) {
case _GraphNode():
return $default(_that.id,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label)?  $default,) {final _that = this;
switch (_that) {
case _GraphNode() when $default != null:
return $default(_that.id,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GraphNode implements GraphNode {
  const _GraphNode({required this.id, required this.label});
  factory _GraphNode.fromJson(Map<String, dynamic> json) => _$GraphNodeFromJson(json);

@override final  String id;
@override final  String label;

/// Create a copy of GraphNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphNodeCopyWith<_GraphNode> get copyWith => __$GraphNodeCopyWithImpl<_GraphNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GraphNodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphNode&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label);

@override
String toString() {
  return 'GraphNode(id: $id, label: $label)';
}


}

/// @nodoc
abstract mixin class _$GraphNodeCopyWith<$Res> implements $GraphNodeCopyWith<$Res> {
  factory _$GraphNodeCopyWith(_GraphNode value, $Res Function(_GraphNode) _then) = __$GraphNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String label
});




}
/// @nodoc
class __$GraphNodeCopyWithImpl<$Res>
    implements _$GraphNodeCopyWith<$Res> {
  __$GraphNodeCopyWithImpl(this._self, this._then);

  final _GraphNode _self;
  final $Res Function(_GraphNode) _then;

/// Create a copy of GraphNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,}) {
  return _then(_GraphNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GraphEdge {

 String get source; String get target; String? get label;
/// Create a copy of GraphEdge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphEdgeCopyWith<GraphEdge> get copyWith => _$GraphEdgeCopyWithImpl<GraphEdge>(this as GraphEdge, _$identity);

  /// Serializes this GraphEdge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphEdge&&(identical(other.source, source) || other.source == source)&&(identical(other.target, target) || other.target == target)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,target,label);

@override
String toString() {
  return 'GraphEdge(source: $source, target: $target, label: $label)';
}


}

/// @nodoc
abstract mixin class $GraphEdgeCopyWith<$Res>  {
  factory $GraphEdgeCopyWith(GraphEdge value, $Res Function(GraphEdge) _then) = _$GraphEdgeCopyWithImpl;
@useResult
$Res call({
 String source, String target, String? label
});




}
/// @nodoc
class _$GraphEdgeCopyWithImpl<$Res>
    implements $GraphEdgeCopyWith<$Res> {
  _$GraphEdgeCopyWithImpl(this._self, this._then);

  final GraphEdge _self;
  final $Res Function(GraphEdge) _then;

/// Create a copy of GraphEdge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? target = null,Object? label = freezed,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphEdge].
extension GraphEdgePatterns on GraphEdge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphEdge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphEdge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphEdge value)  $default,){
final _that = this;
switch (_that) {
case _GraphEdge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphEdge value)?  $default,){
final _that = this;
switch (_that) {
case _GraphEdge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  String target,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphEdge() when $default != null:
return $default(_that.source,_that.target,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  String target,  String? label)  $default,) {final _that = this;
switch (_that) {
case _GraphEdge():
return $default(_that.source,_that.target,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  String target,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _GraphEdge() when $default != null:
return $default(_that.source,_that.target,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GraphEdge implements GraphEdge {
  const _GraphEdge({required this.source, required this.target, this.label});
  factory _GraphEdge.fromJson(Map<String, dynamic> json) => _$GraphEdgeFromJson(json);

@override final  String source;
@override final  String target;
@override final  String? label;

/// Create a copy of GraphEdge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphEdgeCopyWith<_GraphEdge> get copyWith => __$GraphEdgeCopyWithImpl<_GraphEdge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GraphEdgeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphEdge&&(identical(other.source, source) || other.source == source)&&(identical(other.target, target) || other.target == target)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,target,label);

@override
String toString() {
  return 'GraphEdge(source: $source, target: $target, label: $label)';
}


}

/// @nodoc
abstract mixin class _$GraphEdgeCopyWith<$Res> implements $GraphEdgeCopyWith<$Res> {
  factory _$GraphEdgeCopyWith(_GraphEdge value, $Res Function(_GraphEdge) _then) = __$GraphEdgeCopyWithImpl;
@override @useResult
$Res call({
 String source, String target, String? label
});




}
/// @nodoc
class __$GraphEdgeCopyWithImpl<$Res>
    implements _$GraphEdgeCopyWith<$Res> {
  __$GraphEdgeCopyWithImpl(this._self, this._then);

  final _GraphEdge _self;
  final $Res Function(_GraphEdge) _then;

/// Create a copy of GraphEdge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? target = null,Object? label = freezed,}) {
  return _then(_GraphEdge(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
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
