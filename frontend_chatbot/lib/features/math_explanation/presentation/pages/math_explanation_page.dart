import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/bloc/math_explanation/math_explanation_bloc.dart';
import '../../../../core/bloc/auth/auth_bloc.dart';
import '../widgets/math_element_widget.dart';
import '../widgets/image_picker_widget.dart';

@RoutePage()
class MathExplanationPage extends StatefulWidget {
  const MathExplanationPage({super.key});

  @override
  State<MathExplanationPage> createState() => _MathExplanationPageState();
}

class _MathExplanationPageState extends State<MathExplanationPage> {
  final TextEditingController _queryController = TextEditingController();

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  void _explainMath() {
    if (_queryController.text.trim().isEmpty) return;

    context.read<MathExplanationBloc>().add(
      ExplainMathRequested(prompt: _queryController.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Explainer'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        actions: [
          BlocBuilder<MathExplanationBloc, MathExplanationState>(
            builder: (context, state) {
              if (state.explainResponse != null) {
                return IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    context.read<MathExplanationBloc>().add(
                      const ClearExplanation(),
                    );
                  },
                  tooltip: 'New Question',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.account_circle),
            onSelected: (value) {
              if (value == 'signout') {
                context.read<AuthBloc>().add(const SignOutRequested());
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'signout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Sign Out'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<MathExplanationBloc, MathExplanationState>(
        builder: (context, state) {
          final isLoading = state.status == MathExplanationStatus.loading;
          final explainResponse = state.explainResponse;
          final error = state.error;
          final selectedModel = state.selectedModel;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Selected images list with clear all button
                BlocBuilder<MathExplanationBloc, MathExplanationState>(
                  builder: (context, state) {
                    final selectedImages = state.selectedImages;

                    if (selectedImages.isNotEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Selected Images (${selectedImages.length})',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              TextButton.icon(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        context.read<MathExplanationBloc>().add(
                                          const ClearImages(),
                                        );
                                      },
                                icon: const Icon(Icons.clear_all, size: 16),
                                label: const Text('Clear All'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: selectedImages.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          selectedImages[index],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 4,
                                        right: 4,
                                        child: GestureDetector(
                                          onTap: isLoading
                                              ? null
                                              : () {
                                                  context
                                                      .read<
                                                        MathExplanationBloc
                                                      >()
                                                      .add(ImageRemoved(index));
                                                },
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),

                // Model selection - compact radio buttons
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Model:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'openai',
                              groupValue: selectedModel,
                              onChanged: (value) {
                                context.read<MathExplanationBloc>().add(
                                  ModelChanged(value),
                                );
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            const Text(
                              'OpenAI',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 16),
                            Radio<String>(
                              value: 'gemini',
                              groupValue: selectedModel,
                              onChanged: (value) {
                                context.read<MathExplanationBloc>().add(
                                  ModelChanged(value),
                                );
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                            const Text(
                              'Gemini',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Image picker
                const ImagePickerWidget(),
                const SizedBox(height: 16),

                // Text input with send button
                TextField(
                  controller: _queryController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Ask a math question or describe the problem...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: isLoading ? null : _explainMath,
                    ),
                  ),
                  onSubmitted: (_) => _explainMath(),
                ),
                const SizedBox(height: 16),

                // Loading indicator
                if (isLoading) const Center(child: CircularProgressIndicator()),

                // Error message
                if (error != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Colors.red.shade600),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red.shade600),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Explanation content
                if (explainResponse != null) ...[
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Topic header
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Text(
                          explainResponse.topic,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Elements
                      ...explainResponse.elements
                          .map((element) => MathElementWidget(element: element))
                          .toList(),
                    ],
                  ),
                ],

                // Empty state
                if (!isLoading && explainResponse == null && error == null) ...[
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      Icon(
                        Icons.calculate,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Ask a math question to get started',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try: "Explain quadratic equations"',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.blue.shade600,
                              size: 32,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Upload images for enhanced analysis',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Take photos of math problems, equations, or diagrams for AI-powered analysis',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],

                // Add bottom padding to prevent FAB overlap
                const SizedBox(height: 80),
              ],
            ),
          );
        },
      ),
      floatingActionButton:
          BlocBuilder<MathExplanationBloc, MathExplanationState>(
            builder: (context, state) {
              final isLoading = state.status == MathExplanationStatus.loading;

              return FloatingActionButton.extended(
                onPressed: isLoading ? null : () => _captureImage(context),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Capture'),
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
              );
            },
          ),
    );
  }

  Future<void> _captureImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        final File imageFile = File(image.path);
        context.read<MathExplanationBloc>().add(ImagesAdded([imageFile]));

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image captured successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error capturing image: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
