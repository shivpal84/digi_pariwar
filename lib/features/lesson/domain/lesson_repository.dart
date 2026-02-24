import 'package:digi_pariwar/features/lesson/data/step_model/step_model.dart';

import '../../../network/api_client.dart';
import '../data/lesson_list_response/lessons_response_model.dart';
import '../data/lesson_model/lesson_model.dart';
import '../data/steps_response_model/steps_response_model.dart';

abstract class LessonsRepository {
  Future<List<LessonModel>> getLessons();
  Future<List<StepModel>> getLessonSteps(String lessonId);
}

class LessonsRepositoryImpl implements LessonsRepository {
  final ApiClient apiClient;

  LessonsRepositoryImpl(this.apiClient);

  @override
  Future<List<LessonModel>> getLessons() async {
    final response = await apiClient.get("/lessons");

    final parsed = LessonsResponseModel.fromJson(response.data);

    if (!parsed.success) {
      throw Exception(parsed.message);
    }

    // Convert Model -> Entity
    return parsed.data
        .map(
          (model) => LessonModel(
              id: model.id,
              title: model.title,
              description: model.description,
              createdAt: model.createdAt,
              isActive: model.isActive,
              order: model.order,
              updatedAt: model.updatedAt
              // backend doesn't provide status yet
              ),
        )
        .toList();
  }

  @override
  Future<List<StepModel>> getLessonSteps(String lessonId) async {
    final response =
    await apiClient.get("/lessons/$lessonId/steps");

    final parsed = StepsResponseModel.fromJson(response.data);

    if (!parsed.success) {
      throw Exception(parsed.message);
    }

    final steps = parsed.data
        .map(
          (model) => StepModel(
        id: model.id,
        title: model.title,
        description: model.description,
            stepOrder: model.stepOrder,
            lessonId: model.lessonId,
            updatedAt: model.updatedAt,
            createdAt: model.createdAt
      ),
    )
        .toList();

    // Sort by stepOrder
    steps.sort((a, b) => a.stepOrder.compareTo(b.stepOrder));

    return steps;
  }
}
