import 'package:equatable/equatable.dart';

abstract class ConversationsEvent extends Equatable {
  const ConversationsEvent();

  @override
  List<Object?> get props => [];
}

class LoadConversations extends ConversationsEvent {
  const LoadConversations();
}

class LoadMoreConversations extends ConversationsEvent {
  const LoadMoreConversations();
}

class RefreshConversations extends ConversationsEvent {
  const RefreshConversations();
}

class LoadConversationDetail extends ConversationsEvent {
  final String conversationId;

  const LoadConversationDetail(this.conversationId);

  @override
  List<Object?> get props => [conversationId];
}

class DeleteConversation extends ConversationsEvent {
  final String conversationId;

  const DeleteConversation(this.conversationId);

  @override
  List<Object?> get props => [conversationId];
}
