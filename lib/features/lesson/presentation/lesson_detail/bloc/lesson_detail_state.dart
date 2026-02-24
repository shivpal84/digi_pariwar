import 'package:digi_pariwar/features/lesson/data/step_model/step_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/lesson_model/lesson_model.dart';

abstract class LessonDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LessonDetailInitial extends LessonDetailState {}

class LessonDetailLoading extends LessonDetailState {}

class LessonDetailLoaded extends LessonDetailState {
  final LessonModel lesson;

  LessonDetailLoaded(this.lesson);

  @override
  List<Object?> get props => [lesson];
}

class LessonStepsLoading extends LessonDetailState {}

class LessonStepsLoaded extends LessonDetailState {
  final LessonModel lesson;
  final List<StepModel> steps;

  LessonStepsLoaded(this.lesson, this.steps);

  @override
  List<Object?> get props => [lesson, steps];
}

class LessonCompletionLoading extends LessonDetailState {
  final LessonModel lesson;

  LessonCompletionLoading(this.lesson);

  @override
  List<Object?> get props => [lesson];
}

class LessonCompleted extends LessonDetailState {
  final LessonModel lesson;

  LessonCompleted(this.lesson);

  @override
  List<Object?> get props => [lesson];
}

class LessonDetailError extends LessonDetailState {
  final String message;

  LessonDetailError(this.message);

  @override
  List<Object?> get props => [message];
}