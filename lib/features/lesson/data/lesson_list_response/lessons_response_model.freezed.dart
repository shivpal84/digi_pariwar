// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonsResponseModel _$LessonsResponseModelFromJson(Map<String, dynamic> json) {
  return _LessonsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LessonsResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<LessonModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonsResponseModelCopyWith<LessonsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsResponseModelCopyWith<$Res> {
  factory $LessonsResponseModelCopyWith(LessonsResponseModel value,
          $Res Function(LessonsResponseModel) then) =
      _$LessonsResponseModelCopyWithImpl<$Res, LessonsResponseModel>;
  @useResult
  $Res call({bool success, String message, List<LessonModel> data});
}

/// @nodoc
class _$LessonsResponseModelCopyWithImpl<$Res,
        $Val extends LessonsResponseModel>
    implements $LessonsResponseModelCopyWith<$Res> {
  _$LessonsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LessonModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonsResponseModelImplCopyWith<$Res>
    implements $LessonsResponseModelCopyWith<$Res> {
  factory _$$LessonsResponseModelImplCopyWith(_$LessonsResponseModelImpl value,
          $Res Function(_$LessonsResponseModelImpl) then) =
      __$$LessonsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<LessonModel> data});
}

/// @nodoc
class __$$LessonsResponseModelImplCopyWithImpl<$Res>
    extends _$LessonsResponseModelCopyWithImpl<$Res, _$LessonsResponseModelImpl>
    implements _$$LessonsResponseModelImplCopyWith<$Res> {
  __$$LessonsResponseModelImplCopyWithImpl(_$LessonsResponseModelImpl _value,
      $Res Function(_$LessonsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$LessonsResponseModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LessonModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonsResponseModelImpl implements _LessonsResponseModel {
  const _$LessonsResponseModelImpl(
      {required this.success,
      required this.message,
      required final List<LessonModel> data})
      : _data = data;

  factory _$LessonsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonsResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<LessonModel> _data;
  @override
  List<LessonModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LessonsResponseModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsResponseModelImplCopyWith<_$LessonsResponseModelImpl>
      get copyWith =>
          __$$LessonsResponseModelImplCopyWithImpl<_$LessonsResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _LessonsResponseModel implements LessonsResponseModel {
  const factory _LessonsResponseModel(
      {required final bool success,
      required final String message,
      required final List<LessonModel> data}) = _$LessonsResponseModelImpl;

  factory _LessonsResponseModel.fromJson(Map<String, dynamic> json) =
      _$LessonsResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<LessonModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$LessonsResponseModelImplCopyWith<_$LessonsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
