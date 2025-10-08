import 'package:freezed_annotation/freezed_annotation.dart';

part 'math_explanation.freezed.dart';
part 'math_explanation.g.dart';

/// -------------------- REQUEST --------------------

@freezed
abstract class ExplainRequest with _$ExplainRequest {
  const factory ExplainRequest({
    required String query,
    @Default('en') String locale,
    String? model,
  }) = _ExplainRequest;

  factory ExplainRequest.fromJson(Map<String, dynamic> json) =>
      _$ExplainRequestFromJson(json);
}

/// -------------------- RESPONSE (TOP LEVEL) --------------------

@freezed
abstract class MathExplanation with _$MathExplanation {
  @JsonSerializable(explicitToJson: true)
  const factory MathExplanation({
    required String topic,
    required List<MathElement> elements,
  }) = _MathExplanation;

  factory MathExplanation.fromJson(Map<String, dynamic> json) =>
      _$MathExplanationFromJson(json);
}

/// -------------------- ELEMENTS (SEALED UNION) --------------------
/// Khớp 100% với backend Python: union key = "type", union value = snake_case.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
abstract class MathElement with _$MathElement {
  /// text_block
  const factory MathElement.text_block({
    required String id,
    required int order,
    String? title, // backend: Optional[str]
    String? caption,
    required String text,
  }) = _TextBlock;

  /// formula
  const factory MathElement.formula({
    required String id,
    required int order,
    String? title,
    String? caption,
    String? latex,
    String? text,
  }) = _Formula;

  /// example_steps
  const factory MathElement.example_steps({
    required String id,
    required int order,
    String? title,
    String? caption,
    required List<String> steps,
  }) = _ExampleSteps;

  /// bar_chart
  const factory MathElement.bar_chart({
    required String id,
    required int order,
    String? title,
    String? caption,
    required List<double> data,
    required List<String> labels,
    @JsonKey(name: 'image_base64') required String imageBase64,
  }) = _BarChart;

  /// line_chart
  const factory MathElement.line_chart({
    required String id,
    required int order,
    String? title,
    String? caption,
    required List<double> x,
    required List<double> y,
    @JsonKey(name: 'image_base64') required String imageBase64,
  }) = _LineChart;

  /// long_division
  const factory MathElement.long_division({
    required String id,
    required int order,
    String? title,
    String? caption,
    required int dividend,
    required int divisor,
    required List<LongDivisionStep> steps,
  }) = _LongDivision;

  /// life_cycle
  const factory MathElement.life_cycle({
    required String id,
    required int order,
    String? title,
    String? caption,
    required List<String> stages,
  }) = _LifeCycle;

  /// node_graph
  const factory MathElement.node_graph({
    required String id,
    required int order,
    String? title,
    String? caption,
    required List<GraphNode> nodes,
    required List<GraphEdge> edges,
  }) = _NodeGraph;

  /// hex_steps
  const factory MathElement.hex_steps({
    required String id,
    required int order,
    String? title,
    String? caption,
    required List<String> items,
  }) = _HexSteps;

  /// horizontal_blocks
  const factory MathElement.horizontal_blocks({
    required String id,
    required int order,
    String? title,
    String? caption,
    required List<HorizontalItem> items,
  }) = _HorizontalBlocks;

  /// pyramid
  const factory MathElement.pyramid({
    required String id,
    required int order,
    String? title,
    String? caption,
    required List<List<String>> levels,
  }) = _Pyramid;

  factory MathElement.fromJson(Map<String, dynamic> json) =>
      _$MathElementFromJson(json);
}

/// -------------------- SUPPORTING TYPES --------------------

/// Item used inside `horizontal_blocks`
@freezed
abstract class HorizontalItem with _$HorizontalItem {
  const factory HorizontalItem({required String title, required String desc}) =
      _HorizontalItem;

  factory HorizontalItem.fromJson(Map<String, dynamic> json) =>
      _$HorizontalItemFromJson(json);
}

/// Long division step (khớp tên snake_case của backend)
@freezed
abstract class LongDivisionStep with _$LongDivisionStep {
  const factory LongDivisionStep({
    @JsonKey(name: 'quotient_digit') required int quotientDigit,
    @JsonKey(name: 'partial_product') required int partialProduct,
    required int remainder,
  }) = _LongDivisionStep;

  factory LongDivisionStep.fromJson(Map<String, dynamic> json) =>
      _$LongDivisionStepFromJson(json);
}

/// Node/Edge cho node_graph
@freezed
abstract class GraphNode with _$GraphNode {
  const factory GraphNode({required String id, required String label}) =
      _GraphNode;

  factory GraphNode.fromJson(Map<String, dynamic> json) =>
      _$GraphNodeFromJson(json);
}

@freezed
abstract class GraphEdge with _$GraphEdge {
  const factory GraphEdge({
    required String source,
    required String target,
    String? label,
  }) = _GraphEdge;

  factory GraphEdge.fromJson(Map<String, dynamic> json) =>
      _$GraphEdgeFromJson(json);
}
