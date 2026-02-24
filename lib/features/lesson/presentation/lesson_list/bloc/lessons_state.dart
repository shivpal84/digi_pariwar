import 'package:equatable/equatable.dart';

import '../../../data/lesson_model/lesson_model.dart';


abstract class LessonsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LessonsInitial extends LessonsState {}

class LessonsLoading extends LessonsState {}

class LessonsLoaded extends LessonsState {
  final List<LessonModel> lessons;

  LessonsLoaded(this.lessons);

  @override
  List<Object?> get props => [lessons];
}

class LessonsEmpty extends LessonsState {}

class LessonsError extends LessonsState {
  final String message;

  LessonsError(this.message);

  @override
  List<Object?> get props => [message];
}