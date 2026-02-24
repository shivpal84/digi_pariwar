import 'package:bloc_test/bloc_test.dart';
import 'package:digi_pariwar/features/lesson/data/lesson_model/lesson_model.dart';
import 'package:digi_pariwar/features/lesson/data/step_model/step_model.dart';
import 'package:digi_pariwar/features/lesson/domain/lesson_repository.dart';
import 'package:digi_pariwar/features/lesson/presentation/lesson_detail/bloc/lesson_detail_bloc.dart';
import 'package:digi_pariwar/features/lesson/presentation/lesson_detail/bloc/lesson_detail_event.dart';
import 'package:digi_pariwar/features/lesson/presentation/lesson_detail/bloc/lesson_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLessonsRepository extends Mock
    implements LessonsRepository {}

void main() {
  late LessonDetailBloc bloc;
  late MockLessonsRepository mockRepository;

  final lesson = LessonModel(
    id: "1",
    title: "Test",
    description: "Desc",
    order: 1,
    isActive: true,
    createdAt: DateTime.parse("2026-02-20T08:15:15.544Z"),
    updatedAt: DateTime.parse("2026-02-20T08:15:15.544Z"),
  );

  final steps = [
    StepModel(
      id: "s1",
      lessonId: "1",
      title: "Step 1",
      description: "Do this",
      stepOrder:1,
      createdAt: DateTime.parse("2026-02-20T08:15:15.544Z"),
      updatedAt: DateTime.parse("2026-02-20T08:15:15.544Z")
    ),
  ];

  setUp(() {
    mockRepository = MockLessonsRepository();
    bloc = LessonDetailBloc(mockRepository, lesson);
  });

  blocTest<LessonDetailBloc, LessonDetailState>(
    'emits [Loading, Loaded] when steps fetched successfully',
    build: () {
      when(() => mockRepository.getLessonSteps("1"))
          .thenAnswer((_) async => steps);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadLessonSteps("1")),
    expect: () => [
      isA<LessonStepsLoading>(),
      isA<LessonStepsLoaded>(),
    ],
  );

  blocTest<LessonDetailBloc, LessonDetailState>(
    'emits [Loading, Error] when steps fetch fails',
    build: () {
      when(() => mockRepository.getLessonSteps("1"))
          .thenThrow(Exception());
      return bloc;
    },
    act: (bloc) => bloc.add(LoadLessonSteps("1")),
    expect: () => [
      isA<LessonStepsLoading>(),
      isA<LessonDetailError>(),
    ],
  );
}