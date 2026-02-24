import 'package:digi_pariwar/features/profile/data/profile_model.dart';
import 'package:digi_pariwar/features/profile/presentation/bloc/profile_event.dart';
import 'package:digi_pariwar/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<SubmitProfile>(_onSubmitProfile);
  }

  Future<void> _onSubmitProfile(
      SubmitProfile event, Emitter<ProfileState> emit) async {

    // 🔎 Validation
    String? nameError;
    String? ageError;
    String? genderError;

    if (event.name.trim().isEmpty) {
      nameError = "Name is required";
    }

    if (event.age <= 0) {
      ageError = "Enter valid age";
    }

    if (event.gender.isEmpty) {
      genderError = "Please select gender";
    }

    if (nameError != null || ageError != null || genderError != null) {
      emit(ProfileValidationError(
        nameError: nameError,
        ageError: ageError,
        genderError: genderError,
      ));
      return;
    }

    emit(ProfileLoading());

    try {
      var profileModel = ProfileModel(name: event.name.trim(), age: event.age, gender: event.gender);
      await repository.createProfile(profileModel: profileModel);
      emit(ProfileSuccess());
    } catch (e) {
      emit(const ProfileError("Failed to create profile"));
    }
  }
}