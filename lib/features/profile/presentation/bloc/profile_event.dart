import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitProfile extends ProfileEvent {
  final String name;
  final int age;
  final String gender;

  SubmitProfile(this.name, this.age, this.gender);

  @override
  List<Object?> get props => [name, age, gender];
}