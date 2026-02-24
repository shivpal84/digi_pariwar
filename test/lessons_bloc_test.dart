import 'package:bloc_test/bloc_test.dart';
import 'package:digi_pariwar/features/lesson/data/lesson_model/lesson_model.dart';
import 'package:digi_pariwar/features/lesson/domain/lesson_repository.dart';
import 'package:digi_pariwar/features/lesson/presentation/lesson_list/bloc/lesson_event.dart';
import 'package:digi_pariwar/features/lesson/presentation/lesson_list/bloc/lessons_bloc.dart';
import 'package:digi_pariwar/features/lesson/presentation/lesson_list/bloc/lessons_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLessonsRepository extends Mock
    implements LessonsRepository {}

void main() {
  late LessonsBloc bloc;
  late MockLessonsRepository mockRepository;

  setUp(() {
    mockRepository = MockLessonsRepository();
    bloc = LessonsBloc(mockRepository);
  });

  final lessons = [
    LessonModel(
      id: "1",
      title: "Test",
      description: "Desc",
      order: 1,
      isActive: true,
      createdAt: DateTime.parse("2026-02-20T08:15:15.544Z"),
      updatedAt: DateTime.parse("2026-02-20T08:15:15.544Z"),
    ),
  ];

  blocTest<LessonsBloc, LessonsState>(
    'emits [Loading, Loaded] when lessons are fetched successfully',
    build: () {
      when(() => mockRepository.getLessons())
          .thenAnswer((_) async => lessons);
      return bloc;
    },
    act: (bloc) => bloc.add(FetchLessons()),
    expect: () => [
      isA<LessonsLoading>(),
      isA<LessonsLoaded>(),
    ],
  );

  blocTest<LessonsBloc, LessonsState>(
    'emits [Loading, Empty] when repository returns empty list',
    build: () {
      when(() => mockRepository.getLessons())
          .thenAnswer((_) async => []);
      return bloc;
    },
    act: (bloc) => bloc.add(FetchLessons()),
    expect: () => [
      isA<LessonsLoading>(),
      isA<LessonsEmpty>(),
    ],
  );

  blocTest<LessonsBloc, LessonsState>(
    'emits [Loading, Error] when repository throws',
    build: () {
      when(() => mockRepository.getLessons())
          .thenThrow(Exception());
      return bloc;
    },
    act: (bloc) => bloc.add(FetchLessons()),
    expect: () => [
      isA<LessonsLoading>(),
      isA<LessonsError>(),
    ],
  );
}