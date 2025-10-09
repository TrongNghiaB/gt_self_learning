part of 'math_explanation_bloc.dart';

enum MathExplanationStatus { initial, loading, success, failure }

class MathExplanationState extends Equatable {
  final MathExplanationStatus status;
  final MathExplanation? explanation;
  final String? error;
  final String? selectedModel;
  final List<File> selectedImages;

  const MathExplanationState({
    this.status = MathExplanationStatus.initial,
    this.explanation,
    this.error,
    this.selectedModel = 'openai',
    this.selectedImages = const [],
  });

  MathExplanationState copyWith({
    MathExplanationStatus? status,
    MathExplanation? explanation,
    String? error,
    String? selectedModel,
    List<File>? selectedImages,
  }) {
    return MathExplanationState(
      status: status ?? this.status,
      explanation: explanation ?? this.explanation,
      error: error ?? this.error,
      selectedModel: selectedModel ?? this.selectedModel,
      selectedImages: selectedImages ?? this.selectedImages,
    );
  }

  @override
  List<Object?> get props => [
    status,
    explanation,
    error,
    selectedModel,
    selectedImages,
  ];
}
