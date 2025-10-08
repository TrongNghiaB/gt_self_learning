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
      formula: (id, order, title, caption, latex, text) =>
          _buildFormula(title, caption, latex, text),
      example_steps: (id, order, title, caption, steps) =>
          _buildExampleSteps(title, caption, steps),
      bar_chart: (id, order, title, caption, data, labels, imageBase64) =>
          _buildBarChart(title, caption, imageBase64),
      line_chart: (id, order, title, caption, x, y, imageBase64) =>
          _buildLineChart(title, caption, imageBase64),
      long_division: (id, order, title, caption, dividend, divisor, steps) =>
          _buildLongDivision(title, caption, dividend, divisor, steps),
      life_cycle: (id, order, title, caption, stages) =>
          _buildLifeCycle(title, caption, stages),
      node_graph: (id, order, title, caption, nodes, edges) =>
          _buildNodeGraph(title, caption, nodes, edges),
      hex_steps: (id, order, title, caption, items) =>
          _buildHexSteps(title, caption, items),
      horizontal_blocks: (id, order, title, caption, items) =>
          _buildHorizontalBlocks(title, caption, items),
      pyramid: (id, order, title, caption, levels) =>
          _buildPyramid(title, caption, levels),
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

  Widget _buildFormula(
    String? title,
    String? caption,
    String? latex,
    String? text,
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                text ?? latex ?? '',
                style: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
                textAlign: TextAlign.center,
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

  Widget _buildBarChart(String? title, String? caption, String imageBase64) {
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
            _buildBase64Image(imageBase64),
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

  Widget _buildLineChart(String? title, String? caption, String imageBase64) {
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
            _buildBase64Image(imageBase64),
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

  Widget _buildLongDivision(
    String? title,
    String? caption,
    int dividend,
    int divisor,
    List<model.LongDivisionStep> steps,
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
            Text(
              '$dividend ÷ $divisor = ${dividend ~/ divisor}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...steps.map(
              (step) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'Step: ${step.quotientDigit} × $divisor = ${step.partialProduct}, Remainder: ${step.remainder}',
                  style: const TextStyle(fontSize: 14),
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

  Widget _buildLifeCycle(String? title, String? caption, List<String> stages) {
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
            ...stages.asMap().entries.map((entry) {
              final index = entry.key;
              final stage = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
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
                    Expanded(child: Text(stage)),
                    if (index < stages.length - 1)
                      Icon(Icons.arrow_downward, color: Colors.grey.shade400),
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

  Widget _buildNodeGraph(
    String? title,
    String? caption,
    List<model.GraphNode> nodes,
    List<model.GraphEdge> edges,
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
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: nodes
                  .map(
                    (node) => Chip(
                      label: Text(node.label),
                      backgroundColor: Colors.blue.shade100,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),
            ...edges.map(
              (edge) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  '${edge.source} → ${edge.target}${edge.label != null ? ' (${edge.label})' : ''}',
                  style: const TextStyle(fontSize: 14),
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

  Widget _buildHexSteps(String? title, String? caption, List<String> items) {
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
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: items
                  .map(
                    (item) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.orange.shade300),
                      ),
                      child: Text(item),
                    ),
                  )
                  .toList(),
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

  Widget _buildPyramid(
    String? title,
    String? caption,
    List<List<String>> levels,
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
            ...levels.asMap().entries.map((entry) {
              final level = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: level
                      .map(
                        (item) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.teal.shade300),
                          ),
                          child: Text(item),
                        ),
                      )
                      .toList(),
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
