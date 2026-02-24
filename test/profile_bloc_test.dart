import 'package:bloc_test/bloc_test.dart';
import 'package:digi_pariwar/features/profile/data/profile_model.dart';
import 'package:digi_pariwar/features/profile/domain/profile_repository.dart';
import 'package:digi_pariwar/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:digi_pariwar/features/profile/presentation/bloc/profile_event.dart';
import 'package:digi_pariwar/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileRepository extends Mock
    implements ProfileRepository {}

void main() {
  late ProfileBloc bloc;
  late MockProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockProfileRepository();
    bloc = ProfileBloc(mockRepository);
  });

  blocTest<ProfileBloc, ProfileState>(
    'emits ValidationError when fields are empty',
    build: () => bloc,
    act: (bloc) => bloc.add(
      SubmitProfile("", 0, ""),
    ),
    expect: () => [
      isA<ProfileValidationError>(),
    ],
  );

  blocTest<ProfileBloc, ProfileState>(
    'emits [Loading, Success] when valid profile submitted',
    build: () => bloc,
    act: (bloc) => bloc.add(
      SubmitProfile("Ramesh", 58, "male"),
    ),
    expect: () => [
      isA<ProfileLoading>(),
      isA<ProfileSuccess>(),
      // isA<ProfileValidationError>(),
    ],
  );
}