import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:frontend_chatbot/core/bloc/conversations/conversations_bloc.dart';
import 'package:frontend_chatbot/core/bloc/conversations/conversations_event.dart';
import 'package:frontend_chatbot/core/bloc/conversations/conversations_state.dart';
import 'package:frontend_chatbot/core/widgets/common_background.dart';
import 'package:frontend_chatbot/features/math_explanation/presentation/widgets/math_element_widget.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ConversationDetailPage extends StatefulWidget {
  final String conversationId;

  const ConversationDetailPage({super.key, required this.conversationId});

  @override
  State<ConversationDetailPage> createState() => _ConversationDetailPageState();
}

class _ConversationDetailPageState extends State<ConversationDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<ConversationsBloc>().add(
      LoadConversationDetail(widget.conversationId),
    );
  }

  void _onDeleteConversation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Conversation'),
        content: const Text(
          'Are you sure you want to delete this conversation?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ConversationsBloc>().add(
                DeleteConversation(widget.conversationId),
              );
              Navigator.of(context).pop(); // Go back to list
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBackground(
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Expanded(
                      child: Text(
                        'Conversation Detail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: _onDeleteConversation,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                      tooltip: 'Delete conversation',
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: BlocBuilder<ConversationsBloc, ConversationsState>(
                  builder: (context, state) {
                    if (state.detailStatus ==
                        ConversationsStatus.detailLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (state.detailStatus == ConversationsStatus.detailError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.white,
                              size: 64,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Failed to load conversation',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.error ?? 'Unknown error',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<ConversationsBloc>().add(
                                  LoadConversationDetail(widget.conversationId),
                                );
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    final conversation = state.selectedConversation;
                    if (conversation == null) {
                      return const Center(
                        child: Text(
                          'Conversation not found',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Card(
                            color: Colors.white.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Topic
                                  Text(
                                    conversation.topic,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  // Query
                                  Text(
                                    conversation.query,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  // Metadata
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.white.withOpacity(0.7),
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        DateFormat(
                                          'MMM dd, yyyy • HH:mm',
                                        ).format(conversation.createdAt),
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 12,
                                        ),
                                      ),
                                      if (conversation
                                          .imagePaths
                                          .isNotEmpty) ...[
                                        const SizedBox(width: 16),
                                        Icon(
                                          Icons.image,
                                          color: Colors.white.withOpacity(0.7),
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${conversation.imagePaths.length} image${conversation.imagePaths.length > 1 ? 's' : ''}',
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(
                                              0.7,
                                            ),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Elements
                          Text(
                            'Solution',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Math Elements
                          ...conversation.elements.map(
                            (element) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: MathElementWidget(element: element),
                            ),
                          ),

                          const SizedBox(height: 32),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
