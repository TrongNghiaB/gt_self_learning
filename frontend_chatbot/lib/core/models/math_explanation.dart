import 'package:freezed_annotation/freezed_annotation.dart';

part 'math_explanation.freezed.dart';
part 'math_explanation.g.dart';

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

/// Top-level response model
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

/// Sealed union for all element variants.
/// Discriminated by the `"type"` field in JSON (snake_case).
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
abstract class MathElement with _$MathElement {
  // Text block
  const factory MathElement.text_block({
    required String id,
    required int order,
    required String title,
    String? caption,
    required String text,
  }) = _TextBlock;

  // Example with a list of steps
  const factory MathElement.example_steps({
    required String id,
    required int order,
    required String title,
    String? caption,
    required List<String> steps,
  }) = _ExampleSteps;

  // Bar chart with data + labels (+ optional base64 image)
  const factory MathElement.bar_chart({
    required String id,
    required int order,
    required String title,
    String? caption,
    required List<double> data,
    required List<String> labels,
    @JsonKey(name: 'image_base64') String? imageBase64,
  }) = _BarChart;

  // Horizontal blocks (array of items)
  const factory MathElement.horizontal_blocks({
    required String id,
    required int order,
    required String title,
    String? caption,
    required List<HorizontalItem> items,
  }) = _HorizontalBlocks;

  factory MathElement.fromJson(Map<String, dynamic> json) =>
      _$MathElementFromJson(json);
}

/// Item used inside `horizontal_blocks`
@freezed
abstract class HorizontalItem with _$HorizontalItem {
  const factory HorizontalItem({required String title, required String desc}) =
      _HorizontalItem;

  factory HorizontalItem.fromJson(Map<String, dynamic> json) =>
      _$HorizontalItemFromJson(json);
}
