// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'math_explanation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExplainRequest _$ExplainRequestFromJson(Map<String, dynamic> json) =>
    _ExplainRequest(
      query: json['query'] as String,
      locale: json['locale'] as String? ?? 'en',
      model: json['model'] as String?,
    );

Map<String, dynamic> _$ExplainRequestToJson(_ExplainRequest instance) =>
    <String, dynamic>{
      'query': instance.query,
      'locale': instance.locale,
      'model': instance.model,
    };

_MathExplanation _$MathExplanationFromJson(Map<String, dynamic> json) =>
    _MathExplanation(
      topic: json['topic'] as String,
      elements: (json['elements'] as List<dynamic>)
          .map((e) => MathElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MathExplanationToJson(_MathExplanation instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'elements': instance.elements.map((e) => e.toJson()).toList(),
    };

_TextBlock _$TextBlockFromJson(Map<String, dynamic> json) => _TextBlock(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String,
  caption: json['caption'] as String?,
  text: json['text'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$TextBlockToJson(_TextBlock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'title': instance.title,
      'caption': instance.caption,
      'text': instance.text,
      'type': instance.$type,
    };

_ExampleSteps _$ExampleStepsFromJson(Map<String, dynamic> json) =>
    _ExampleSteps(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      title: json['title'] as String,
      caption: json['caption'] as String?,
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ExampleStepsToJson(_ExampleSteps instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'title': instance.title,
      'caption': instance.caption,
      'steps': instance.steps,
      'type': instance.$type,
    };

_BarChart _$BarChartFromJson(Map<String, dynamic> json) => _BarChart(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String,
  caption: json['caption'] as String?,
  data: (json['data'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  labels: (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
  imageBase64: json['image_base64'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$BarChartToJson(_BarChart instance) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'title': instance.title,
  'caption': instance.caption,
  'data': instance.data,
  'labels': instance.labels,
  'image_base64': instance.imageBase64,
  'type': instance.$type,
};

_HorizontalBlocks _$HorizontalBlocksFromJson(Map<String, dynamic> json) =>
    _HorizontalBlocks(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      title: json['title'] as String,
      caption: json['caption'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => HorizontalItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$HorizontalBlocksToJson(_HorizontalBlocks instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'title': instance.title,
      'caption': instance.caption,
      'items': instance.items,
      'type': instance.$type,
    };

_HorizontalItem _$HorizontalItemFromJson(Map<String, dynamic> json) =>
    _HorizontalItem(
      title: json['title'] as String,
      desc: json['desc'] as String,
    );

Map<String, dynamic> _$HorizontalItemToJson(_HorizontalItem instance) =>
    <String, dynamic>{'title': instance.title, 'desc': instance.desc};
