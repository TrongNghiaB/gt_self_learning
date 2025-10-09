import 'package:freezed_annotation/freezed_annotation.dart';
import 'math_explanation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
abstract class ConversationSummary with _$ConversationSummary {
  const factory ConversationSummary({
    required String id,
    required String topic,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'image_count') required int imageCount,
  }) = _ConversationSummary;

  factory ConversationSummary.fromJson(Map<String, dynamic> json) =>
      _$ConversationSummaryFromJson(json);
}

@freezed
abstract class ConversationDetail with _$ConversationDetail {
  const factory ConversationDetail({
    required String id,
    required String topic,
    required String query,
    required List<MathElement> elements,
    @JsonKey(name: 'image_paths') required List<String> imagePaths,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ConversationDetail;

  factory ConversationDetail.fromJson(Map<String, dynamic> json) =>
      _$ConversationDetailFromJson(json);
}

@freezed
abstract class ConversationListResponse with _$ConversationListResponse {
  const factory ConversationListResponse({
    required List<ConversationSummary> conversations,
    @JsonKey(name: 'next_cursor') String? nextCursor,
    @JsonKey(name: 'has_more') required bool hasMore,
    required int count,
  }) = _ConversationListResponse;

  factory ConversationListResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationListResponseFromJson(json);
}
