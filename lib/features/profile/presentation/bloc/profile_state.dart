import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileValidationError extends ProfileState {
  final String? nameError;
  final String? ageError;
  final String? genderError;

  const ProfileValidationError({
    this.nameError,
    this.ageError,
    this.genderError,
  });

  @override
  List<Object?> get props => [nameError, ageError, genderError];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}