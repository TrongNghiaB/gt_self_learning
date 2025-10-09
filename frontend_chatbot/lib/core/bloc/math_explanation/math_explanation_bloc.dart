import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/math_explanation.dart';
import '../../network/api_service.dart';

part 'math_explanation_event.dart';
part 'math_explanation_state.dart';

class MathExplanationBloc
    extends Bloc<MathExplanationEvent, MathExplanationState> {
  final ApiService _apiService;

  MathExplanationBloc({ApiService? apiService})
    : _apiService = apiService ?? ApiService(),
      super(const MathExplanationState()) {
    on<ExplainMathRequested>(_onExplainMathRequested);
    on<ModelChanged>(_onModelChanged);
    on<ClearExplanation>(_onClearExplanation);
    on<ImagesAdded>(_onImagesAdded);
    on<ImageRemoved>(_onImageRemoved);
    on<ClearImages>(_onClearImages);
  }

  Future<void> _onExplainMathRequested(
    ExplainMathRequested event,
    Emitter<MathExplanationState> emit,
  ) async {
    if (event.prompt.trim().isEmpty) return;

    emit(state.copyWith(status: MathExplanationStatus.loading));

    try {
      final response = await _apiService.explainMath(
        prompt: event.prompt.trim(),
        locale: event.locale,
        model: state.selectedModel,
        imageFiles: state.selectedImages,
      );

      final explainResponse = ExplainResponse.fromJson(response);
      emit(
        state.copyWith(
          status: MathExplanationStatus.success,
          explainResponse: explainResponse,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MathExplanationStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  void _onModelChanged(ModelChanged event, Emitter<MathExplanationState> emit) {
    emit(state.copyWith(selectedModel: event.model));
  }

  void _onClearExplanation(
    ClearExplanation event,
    Emitter<MathExplanationState> emit,
  ) {
    emit(const MathExplanationState());
  }

  void _onImagesAdded(ImagesAdded event, Emitter<MathExplanationState> emit) {
    final currentImages = List<File>.from(state.selectedImages);
    currentImages.addAll(event.images);
    emit(state.copyWith(selectedImages: currentImages));
  }

  void _onImageRemoved(ImageRemoved event, Emitter<MathExplanationState> emit) {
    final currentImages = List<File>.from(state.selectedImages);
    currentImages.removeAt(event.index);
    emit(state.copyWith(selectedImages: currentImages));
  }

  void _onClearImages(ClearImages event, Emitter<MathExplanationState> emit) {
    emit(state.copyWith(selectedImages: []));
  }
}
