import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../core/models/math_explanation.dart';
import '../../../../core/network/api_service.dart';
import '../widgets/math_element_widget.dart';

@RoutePage()
class MathExplanationPage extends HookConsumerWidget {
  const MathExplanationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queryController = useTextEditingController();
    final isLoading = useState(false);
    final explanation = useState<MathExplanation?>(null);
    final error = useState<String?>(null);
    final selectedModel = useState<String?>('openai');
    final apiService = useMemoized(() => ApiService());

    Future<void> explainMath() async {
      if (queryController.text.trim().isEmpty) return;

      isLoading.value = true;
      error.value = null;

      try {
        final response = await apiService.explainMath(
          query: queryController.text.trim(),
          locale: 'en',
          model: selectedModel.value,
        );
        print('response: $response');
        explanation.value = MathExplanation.fromJson(response);
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Explainer'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Model selection
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose AI Model:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('OpenAI'),
                          subtitle: const Text('GPT-4 (Recommended)'),
                          value: 'openai',
                          groupValue: selectedModel.value,
                          onChanged: (value) => selectedModel.value = value,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Gemini'),
                          subtitle: const Text('Google AI'),
                          value: 'gemini',
                          groupValue: selectedModel.value,
                          onChanged: (value) => selectedModel.value = value,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Both'),
                          subtitle: const Text('Try both models'),
                          value: 'both',
                          groupValue: selectedModel.value,
                          onChanged: (value) => selectedModel.value = value,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Search input
            TextField(
              controller: queryController,
              decoration: InputDecoration(
                hintText: 'Ask a math question...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: explainMath,
                ),
              ),
              onSubmitted: (_) => explainMath(),
            ),
            const SizedBox(height: 16),

            // Loading indicator
            if (isLoading.value)
              const Center(child: CircularProgressIndicator()),

            // Error message
            if (error.value != null)
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
                        error.value!,
                        style: TextStyle(color: Colors.red.shade600),
                      ),
                    ),
                  ],
                ),
              ),

            // Explanation content
            if (explanation.value != null) ...[
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                          explanation.value!.topic,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Elements
                      ...explanation.value!.elements
                          .map((element) => MathElementWidget(element: element))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ],

            // Empty state
            if (!isLoading.value &&
                explanation.value == null &&
                error.value == null)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
