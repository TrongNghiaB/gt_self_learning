// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationSummary _$ConversationSummaryFromJson(Map<String, dynamic> json) =>
    _ConversationSummary(
      id: json['id'] as String,
      topic: json['topic'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      imageCount: (json['image_count'] as num).toInt(),
    );

Map<String, dynamic> _$ConversationSummaryToJson(
  _ConversationSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'topic': instance.topic,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'image_count': instance.imageCount,
};

_ConversationDetail _$ConversationDetailFromJson(Map<String, dynamic> json) =>
    _ConversationDetail(
      id: json['id'] as String,
      topic: json['topic'] as String,
      query: json['query'] as String,
      elements: (json['elements'] as List<dynamic>)
          .map((e) => MathElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagePaths: (json['image_paths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ConversationDetailToJson(_ConversationDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'query': instance.query,
      'elements': instance.elements,
      'image_paths': instance.imagePaths,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_ConversationListResponse _$ConversationListResponseFromJson(
  Map<String, dynamic> json,
) => _ConversationListResponse(
  conversations: (json['conversations'] as List<dynamic>)
      .map((e) => ConversationSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextCursor: json['next_cursor'] as String?,
  hasMore: json['has_more'] as bool,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$ConversationListResponseToJson(
  _ConversationListResponse instance,
) => <String, dynamic>{
  'conversations': instance.conversations,
  'next_cursor': instance.nextCursor,
  'has_more': instance.hasMore,
  'count': instance.count,
};
