part of 'math_explanation_bloc.dart';

enum MathExplanationStatus { initial, loading, success, failure }

class MathExplanationState extends Equatable {
  final MathExplanationStatus status;
  final ExplainResponse? explainResponse;
  final String? error;
  final String? selectedModel;
  final List<File> selectedImages;

  const MathExplanationState({
    this.status = MathExplanationStatus.initial,
    this.explainResponse,
    this.error,
    this.selectedModel = 'openai',
    this.selectedImages = const [],
  });

  MathExplanationState copyWith({
    MathExplanationStatus? status,
    ExplainResponse? explainResponse,
    String? error,
    String? selectedModel,
    List<File>? selectedImages,
  }) {
    return MathExplanationState(
      status: status ?? this.status,
      explainResponse: explainResponse ?? this.explainResponse,
      error: error ?? this.error,
      selectedModel: selectedModel ?? this.selectedModel,
      selectedImages: selectedImages ?? this.selectedImages,
    );
  }

  @override
  List<Object?> get props => [
    status,
    explainResponse,
    error,
    selectedModel,
    selectedImages,
  ];
}
