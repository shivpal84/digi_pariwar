// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonsResponseModelImpl _$$LessonsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonsResponseModelImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LessonsResponseModelImplToJson(
        _$LessonsResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
