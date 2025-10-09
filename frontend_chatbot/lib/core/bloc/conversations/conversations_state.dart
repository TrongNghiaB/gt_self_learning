import 'package:equatable/equatable.dart';
import 'package:frontend_chatbot/core/models/conversation.dart';

enum ConversationsStatus {
  initial,
  loading,
  loaded,
  loadingMore,
  error,
  detailLoading,
  detailLoaded,
  detailError,
}

class ConversationsState extends Equatable {
  final ConversationsStatus status;
  final List<ConversationSummary> conversations;
  final String? nextCursor;
  final bool hasMore;
  final String? error;
  final ConversationDetail? selectedConversation;
  final ConversationsStatus detailStatus;

  const ConversationsState({
    this.status = ConversationsStatus.initial,
    this.conversations = const [],
    this.nextCursor,
    this.hasMore = false,
    this.error,
    this.selectedConversation,
    this.detailStatus = ConversationsStatus.initial,
  });

  ConversationsState copyWith({
    ConversationsStatus? status,
    List<ConversationSummary>? conversations,
    String? nextCursor,
    bool? hasMore,
    String? error,
    ConversationDetail? selectedConversation,
    ConversationsStatus? detailStatus,
  }) {
    return ConversationsState(
      status: status ?? this.status,
      conversations: conversations ?? this.conversations,
      nextCursor: nextCursor ?? this.nextCursor,
      hasMore: hasMore ?? this.hasMore,
      error: error ?? this.error,
      selectedConversation: selectedConversation ?? this.selectedConversation,
      detailStatus: detailStatus ?? this.detailStatus,
    );
  }

  @override
  List<Object?> get props => [
    status,
    conversations,
    nextCursor,
    hasMore,
    error,
    selectedConversation,
    detailStatus,
  ];
}
