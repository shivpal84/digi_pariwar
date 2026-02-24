import 'package:digi_pariwar/features/lesson/data/lesson_model/lesson_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/lesson_repository.dart';
import 'lesson_detail_event.dart';
import 'lesson_detail_state.dart';

class LessonDetailBloc
    extends Bloc<LessonDetailEvent, LessonDetailState> {

  final LessonsRepository repository;
  final LessonModel lesson;

  LessonDetailBloc(this.repository, this.lesson) : super(LessonDetailInitial()) {
    on<LoadLessonDetail>(_onLoadLessonDetail);
    on<MarkLessonCompleted>(_onMarkCompleted);
    on<LoadLessonSteps>(_onLoadSteps);
  }

  Future<void> _onLoadSteps(
      LoadLessonSteps event,
      Emitter<LessonDetailState> emit,
      ) async {
    emit(LessonStepsLoading());

    try {
      final steps =
      await repository.getLessonSteps(event.lessonId);

      if (steps.isEmpty) {
        emit(LessonDetailError("No steps available"));
      } else {
        emit(LessonStepsLoaded(lesson, steps));
      }
    } catch (e) {
      emit(LessonDetailError("Failed to load steps"));
    }
  }


  void _onLoadLessonDetail(
      LoadLessonDetail event,
      Emitter<LessonDetailState> emit,
      ) {
    emit(LessonDetailLoaded(event.lesson));
  }

  Future<void> _onMarkCompleted(
      MarkLessonCompleted event,
      Emitter<LessonDetailState> emit,
      ) async {
    if (state is LessonDetailLoaded) {
      final lesson = (state as LessonDetailLoaded).lesson;

      emit(LessonCompletionLoading(lesson));

      // try {
      //   // 🔄 Simulate API call
      //   await Future.delayed(const Duration(seconds: 2));
      //
      //   final updatedLesson = Lesson(
      //     id: lesson.id,
      //     title: lesson.title,
      //     description: lesson.description,
      //     status: "completed",
      //   );
      //
      //   emit(LessonCompleted(updatedLesson));
      // } catch (e) {
      //   emit(LessonDetailError("Failed to complete lesson"));
      // }
    }
  }
}