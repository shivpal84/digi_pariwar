import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/lesson_repository.dart';
import 'lesson_event.dart';
import 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final LessonsRepository repository;

  LessonsBloc(this.repository) : super(LessonsInitial()) {
    on<FetchLessons>(_onFetchLessons);
  }

  Future<void> _onFetchLessons(
      FetchLessons event,
      Emitter<LessonsState> emit,
      ) async {
    emit(LessonsLoading());

    try {
      final lessons = await repository.getLessons();

      if (lessons.isEmpty) {
        emit(LessonsEmpty());
      } else {
        emit(LessonsLoaded(lessons));
      }
    } catch (e) {
      emit(LessonsError("Failed to load lessons"));
    }
  }
}