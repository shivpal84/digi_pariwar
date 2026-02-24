// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steps_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepsResponseModelImpl _$$StepsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StepsResponseModelImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => StepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StepsResponseModelImplToJson(
        _$StepsResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
