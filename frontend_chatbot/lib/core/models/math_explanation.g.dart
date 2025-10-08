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
  title: json['title'] as String?,
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

_Formula _$FormulaFromJson(Map<String, dynamic> json) => _Formula(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String?,
  caption: json['caption'] as String?,
  latex: json['latex'] as String?,
  text: json['text'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$FormulaToJson(_Formula instance) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'title': instance.title,
  'caption': instance.caption,
  'latex': instance.latex,
  'text': instance.text,
  'type': instance.$type,
};

_ExampleSteps _$ExampleStepsFromJson(Map<String, dynamic> json) =>
    _ExampleSteps(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      title: json['title'] as String?,
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
  title: json['title'] as String?,
  caption: json['caption'] as String?,
  data: (json['data'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  labels: (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
  imageBase64: json['image_base64'] as String,
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

_LineChart _$LineChartFromJson(Map<String, dynamic> json) => _LineChart(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String?,
  caption: json['caption'] as String?,
  x: (json['x'] as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
  y: (json['y'] as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
  imageBase64: json['image_base64'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$LineChartToJson(_LineChart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'title': instance.title,
      'caption': instance.caption,
      'x': instance.x,
      'y': instance.y,
      'image_base64': instance.imageBase64,
      'type': instance.$type,
    };

_LongDivision _$LongDivisionFromJson(Map<String, dynamic> json) =>
    _LongDivision(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      dividend: (json['dividend'] as num).toInt(),
      divisor: (json['divisor'] as num).toInt(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => LongDivisionStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$LongDivisionToJson(_LongDivision instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'title': instance.title,
      'caption': instance.caption,
      'dividend': instance.dividend,
      'divisor': instance.divisor,
      'steps': instance.steps,
      'type': instance.$type,
    };

_LifeCycle _$LifeCycleFromJson(Map<String, dynamic> json) => _LifeCycle(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String?,
  caption: json['caption'] as String?,
  stages: (json['stages'] as List<dynamic>).map((e) => e as String).toList(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$LifeCycleToJson(_LifeCycle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'title': instance.title,
      'caption': instance.caption,
      'stages': instance.stages,
      'type': instance.$type,
    };

_NodeGraph _$NodeGraphFromJson(Map<String, dynamic> json) => _NodeGraph(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String?,
  caption: json['caption'] as String?,
  nodes: (json['nodes'] as List<dynamic>)
      .map((e) => GraphNode.fromJson(e as Map<String, dynamic>))
      .toList(),
  edges: (json['edges'] as List<dynamic>)
      .map((e) => GraphEdge.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$NodeGraphToJson(_NodeGraph instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'title': instance.title,
      'caption': instance.caption,
      'nodes': instance.nodes,
      'edges': instance.edges,
      'type': instance.$type,
    };

_HexSteps _$HexStepsFromJson(Map<String, dynamic> json) => _HexSteps(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String?,
  caption: json['caption'] as String?,
  items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$HexStepsToJson(_HexSteps instance) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'title': instance.title,
  'caption': instance.caption,
  'items': instance.items,
  'type': instance.$type,
};

_HorizontalBlocks _$HorizontalBlocksFromJson(Map<String, dynamic> json) =>
    _HorizontalBlocks(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      title: json['title'] as String?,
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

_Pyramid _$PyramidFromJson(Map<String, dynamic> json) => _Pyramid(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String?,
  caption: json['caption'] as String?,
  levels: (json['levels'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
      .toList(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$PyramidToJson(_Pyramid instance) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'title': instance.title,
  'caption': instance.caption,
  'levels': instance.levels,
  'type': instance.$type,
};

_HorizontalItem _$HorizontalItemFromJson(Map<String, dynamic> json) =>
    _HorizontalItem(
      title: json['title'] as String,
      desc: json['desc'] as String,
    );

Map<String, dynamic> _$HorizontalItemToJson(_HorizontalItem instance) =>
    <String, dynamic>{'title': instance.title, 'desc': instance.desc};

_LongDivisionStep _$LongDivisionStepFromJson(Map<String, dynamic> json) =>
    _LongDivisionStep(
      quotientDigit: (json['quotient_digit'] as num).toInt(),
      partialProduct: (json['partial_product'] as num).toInt(),
      remainder: (json['remainder'] as num).toInt(),
    );

Map<String, dynamic> _$LongDivisionStepToJson(_LongDivisionStep instance) =>
    <String, dynamic>{
      'quotient_digit': instance.quotientDigit,
      'partial_product': instance.partialProduct,
      'remainder': instance.remainder,
    };

_GraphNode _$GraphNodeFromJson(Map<String, dynamic> json) =>
    _GraphNode(id: json['id'] as String, label: json['label'] as String);

Map<String, dynamic> _$GraphNodeToJson(_GraphNode instance) =>
    <String, dynamic>{'id': instance.id, 'label': instance.label};

_GraphEdge _$GraphEdgeFromJson(Map<String, dynamic> json) => _GraphEdge(
  source: json['source'] as String,
  target: json['target'] as String,
  label: json['label'] as String?,
);

Map<String, dynamic> _$GraphEdgeToJson(_GraphEdge instance) =>
    <String, dynamic>{
      'source': instance.source,
      'target': instance.target,
      'label': instance.label,
    };
