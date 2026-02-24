import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_bloc.dart';
import 'bloc/profile_event.dart';
import 'bloc/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String _selectedGender = '';

  String? nameError;
  String? ageError;
  String? genderError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complete Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSuccess) {
              setState(() {
                nameError = null;
                ageError = null;
                genderError = null;
              });
              Navigator.pushReplacementNamed(context, '/lessons');
            }

            if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }

            if (state is ProfileValidationError) {
              setState(() {
                nameError = state.nameError;
                ageError = state.ageError;
                genderError = state.genderError;
              });
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name
                  TextField(
                    controller: _nameController,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      labelText: "Name",
                      errorText: nameError,
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Age
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      labelText: "Age",
                      errorText: ageError,
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Gender
                  DropdownButtonFormField<String>(
                    value: _selectedGender.isEmpty ? null : _selectedGender,
                    decoration: InputDecoration(
                      labelText: "Gender",
                      errorText: genderError,
                    ),
                    items: const [
                      DropdownMenuItem(value: "male", child: Text("Male")),
                      DropdownMenuItem(value: "female", child: Text("Female")),
                      DropdownMenuItem(value: "other", child: Text("Other")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value ?? '';
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  /// Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: state is ProfileLoading
                          ? null
                          : () {
                        context.read<ProfileBloc>().add(
                          SubmitProfile(
                            _nameController.text,
                            int.tryParse(_ageController.text) ?? 0,
                            _selectedGender,
                          ),
                        );

                        // Navigator.pushReplacementNamed(context, '/lessons');
                      },
                      child: state is ProfileLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        "Continue",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}