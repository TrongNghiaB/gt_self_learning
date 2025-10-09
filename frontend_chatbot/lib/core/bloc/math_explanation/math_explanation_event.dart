part of 'math_explanation_bloc.dart';

abstract class MathExplanationEvent extends Equatable {
  const MathExplanationEvent();

  @override
  List<Object?> get props => [];
}

class ExplainMathRequested extends MathExplanationEvent {
  final String prompt;
  final String locale;

  const ExplainMathRequested({required this.prompt, this.locale = 'en'});

  @override
  List<Object?> get props => [prompt, locale];
}

class ModelChanged extends MathExplanationEvent {
  final String? model;

  const ModelChanged(this.model);

  @override
  List<Object?> get props => [model];
}

class ClearExplanation extends MathExplanationEvent {
  const ClearExplanation();
}

class ImagesAdded extends MathExplanationEvent {
  final List<File> images;

  const ImagesAdded(this.images);

  @override
  List<Object?> get props => [images];
}

class ImageRemoved extends MathExplanationEvent {
  final int index;

  const ImageRemoved(this.index);

  @override
  List<Object?> get props => [index];
}

class ClearImages extends MathExplanationEvent {
  const ClearImages();
}
