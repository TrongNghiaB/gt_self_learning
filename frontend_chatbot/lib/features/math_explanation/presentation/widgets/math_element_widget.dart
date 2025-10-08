import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:frontend_chatbot/core/models/math_explanation.dart' as model;

class MathElementWidget extends StatelessWidget {
  final model.MathElement element;

  const MathElementWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: _buildElementContent(),
    );
  }

  Widget _buildElementContent() {
    return element.when(
      text_block: (id, order, title, caption, text) =>
          _buildTextBlock(title, caption, text),
      example_steps: (id, order, title, caption, steps) =>
          _buildExampleSteps(title, caption, steps),
      bar_chart: (id, order, title, caption, data, labels, imageBase64) =>
          _buildBarChart(title, caption, imageBase64),
      horizontal_blocks: (id, order, title, caption, items) =>
          _buildHorizontalBlocks(title, caption, items),
    );
  }

  Widget _buildTextBlock(String? title, String? caption, String text) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
            Text(text, style: const TextStyle(fontSize: 16)),
            if (caption != null) ...[
              const SizedBox(height: 8),
              Text(
                caption,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildExampleSteps(
    String? title,
    String? caption,
    List<String> steps,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
            ...steps.asMap().entries.map((entry) {
              final index = entry.key;
              final step = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(step, style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              );
            }).toList(),
            if (caption != null) ...[
              const SizedBox(height: 8),
              Text(
                caption,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(String? title, String? caption, String? imageBase64) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
            if (imageBase64 != null)
              _buildBase64Image(imageBase64)
            else
              const Text('Chart data not available'),
            if (caption != null) ...[
              const SizedBox(height: 8),
              Text(
                caption,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalBlocks(
    String? title,
    String? caption,
    List<model.HorizontalItem> items,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
            ...items.map(
              (block) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.purple.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      block.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(block.desc, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
            if (caption != null) ...[
              const SizedBox(height: 8),
              Text(
                caption,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBase64Image(String base64String) {
    try {
      final bytes = base64Decode(base64String);
      return Image.memory(
        Uint8List.fromList(bytes),
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return const Text('Failed to load image');
        },
      );
    } catch (e) {
      return const Text('Invalid image data');
    }
  }
}
