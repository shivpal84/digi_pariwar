import 'package:freezed_annotation/freezed_annotation.dart';

import '../step_model/step_model.dart';

part 'steps_response_model.freezed.dart';
part 'steps_response_model.g.dart';

@freezed
class StepsResponseModel with _$StepsResponseModel {
  const factory StepsResponseModel({
    required bool success,
    required String message,
    required List<StepModel> data,
  }) = _StepsResponseModel;

  factory StepsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StepsResponseModelFromJson(json);
}