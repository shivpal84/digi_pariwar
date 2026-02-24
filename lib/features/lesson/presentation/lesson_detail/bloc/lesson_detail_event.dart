import 'package:equatable/equatable.dart';

import '../../../data/lesson_model/lesson_model.dart';


abstract class LessonDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLessonDetail extends LessonDetailEvent {
  final LessonModel lesson;

  LoadLessonDetail(this.lesson);

  @override
  List<Object?> get props => [lesson];
}

class LoadLessonSteps extends LessonDetailEvent {
  final String lessonId;

  LoadLessonSteps(this.lessonId);

  @override
  List<Object?> get props => [lessonId];
}

class MarkLessonCompleted extends LessonDetailEvent {

  MarkLessonCompleted();
  @override
  List<Object?> get props => [];
}