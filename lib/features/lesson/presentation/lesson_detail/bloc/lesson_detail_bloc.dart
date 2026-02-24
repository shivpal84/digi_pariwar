import 'package:digi_pariwar/features/lesson/data/lesson_model/lesson_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/lesson_repository.dart';
import 'lesson_detail_event.dart';
import 'lesson_detail_state.dart';

class LessonDetailBloc extends Bloc<LessonDetailEvent, LessonDetailState> {
  final LessonsRepository repository;
  final LessonModel lesson;

  LessonDetailBloc(this.repository, this.lesson)
      : super(LessonDetailInitial()) {
    on<MarkLessonCompleted>(_onMarkCompleted);
    on<LoadLessonSteps>(_onLoadSteps);
  }

  Future<void> _onLoadSteps(
    LoadLessonSteps event,
    Emitter<LessonDetailState> emit,
  ) async {
    emit(LessonStepsLoading());

    try {
      final steps = await repository.getLessonSteps(event.lessonId);

      if (steps.isEmpty) {
        emit(LessonDetailError("No steps available"));
      } else {
        emit(LessonStepsLoaded(lesson, steps));
      }
    } catch (e) {
      emit(LessonDetailError("Failed to load steps"));
    }
  }

  Future<void> _onMarkCompleted(
    MarkLessonCompleted event,
    Emitter<LessonDetailState> emit,
  ) async {
    if (state is LessonStepsLoaded) {
      final lesson = (state as LessonStepsLoaded).lesson;

      emit(LessonCompletionLoading(lesson));

      try {
        // 🔄 Simulate API call
        await Future.delayed(const Duration(seconds: 2));

        emit(LessonCompleted());
      } catch (e) {
        emit(LessonDetailError("Failed to complete lesson"));
      }
    }
  }
}
