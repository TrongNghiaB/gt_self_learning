import 'package:bloc/bloc.dart';
import 'package:frontend_chatbot/core/network/api_service.dart';

import 'conversations_event.dart';
import 'conversations_state.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  final ApiService _apiService;

  ConversationsBloc({required ApiService apiService})
    : _apiService = apiService,
      super(const ConversationsState()) {
    on<LoadConversations>(_onLoadConversations);
    on<LoadMoreConversations>(_onLoadMoreConversations);
    on<RefreshConversations>(_onRefreshConversations);
    on<LoadConversationDetail>(_onLoadConversationDetail);
    on<DeleteConversation>(_onDeleteConversation);
  }

  Future<void> _onLoadConversations(
    LoadConversations event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(state.copyWith(status: ConversationsStatus.loading, error: null));

    try {
      final response = await _apiService.getConversations(limit: 10);

      emit(
        state.copyWith(
          status: ConversationsStatus.loaded,
          conversations: response.conversations,
          nextCursor: response.nextCursor,
          hasMore: response.hasMore,
          error: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ConversationsStatus.error, error: e.toString()),
      );
    }
  }

  Future<void> _onLoadMoreConversations(
    LoadMoreConversations event,
    Emitter<ConversationsState> emit,
  ) async {
    if (!state.hasMore || state.status == ConversationsStatus.loadingMore) {
      return;
    }

    emit(state.copyWith(status: ConversationsStatus.loadingMore));

    try {
      final response = await _apiService.getConversations(
        limit: 10,
        cursor: state.nextCursor,
      );

      emit(
        state.copyWith(
          status: ConversationsStatus.loaded,
          conversations: [...state.conversations, ...response.conversations],
          nextCursor: response.nextCursor,
          hasMore: response.hasMore,
          error: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ConversationsStatus.error, error: e.toString()),
      );
    }
  }

  Future<void> _onRefreshConversations(
    RefreshConversations event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(state.copyWith(status: ConversationsStatus.loading, error: null));

    try {
      final response = await _apiService.getConversations(limit: 10);

      emit(
        state.copyWith(
          status: ConversationsStatus.loaded,
          conversations: response.conversations,
          nextCursor: response.nextCursor,
          hasMore: response.hasMore,
          error: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ConversationsStatus.error, error: e.toString()),
      );
    }
  }

  Future<void> _onLoadConversationDetail(
    LoadConversationDetail event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(
      state.copyWith(
        detailStatus: ConversationsStatus.detailLoading,
        error: null,
      ),
    );

    try {
      final conversation = await _apiService.getConversationDetail(
        event.conversationId,
      );

      emit(
        state.copyWith(
          detailStatus: ConversationsStatus.detailLoaded,
          selectedConversation: conversation,
          error: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          detailStatus: ConversationsStatus.detailError,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onDeleteConversation(
    DeleteConversation event,
    Emitter<ConversationsState> emit,
  ) async {
    try {
      await _apiService.deleteConversation(event.conversationId);

      // Remove the deleted conversation from the list
      final updatedConversations = state.conversations
          .where((conv) => conv.id != event.conversationId)
          .toList();

      emit(state.copyWith(conversations: updatedConversations, error: null));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
