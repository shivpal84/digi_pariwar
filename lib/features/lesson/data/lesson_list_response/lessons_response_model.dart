import 'package:freezed_annotation/freezed_annotation.dart';
import '../lesson_model/lesson_model.dart';

part 'lessons_response_model.freezed.dart';
part 'lessons_response_model.g.dart';

@freezed
class LessonsResponseModel with _$LessonsResponseModel {
  const factory LessonsResponseModel({
    required bool success,
    required String message,
    required List<LessonModel> data,
  }) = _LessonsResponseModel;

  factory LessonsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LessonsResponseModelFromJson(json);
}