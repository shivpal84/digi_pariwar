import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_model.freezed.dart';
part 'step_model.g.dart';

@freezed
class StepModel with _$StepModel {
  const factory StepModel({
    @JsonKey(name: '_id') required String id,
    required String lessonId,
    required String title,
    required String description,
    required int stepOrder,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StepModel;

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);
}