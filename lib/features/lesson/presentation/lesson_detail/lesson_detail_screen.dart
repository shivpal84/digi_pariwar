import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/lesson_model/lesson_model.dart';
import 'bloc/lesson_detail_bloc.dart';
import 'bloc/lesson_detail_event.dart';
import 'bloc/lesson_detail_state.dart';

class LessonDetailScreen extends StatefulWidget {
  final LessonModel lesson;

  const LessonDetailScreen({super.key, required this.lesson});

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  @override
  void initState() {
    super.initState();
    // context
    //     .read<LessonDetailBloc>()
    //     .add(LoadLessonDetail(widget.lesson));

    context.read<LessonDetailBloc>().add(LoadLessonSteps(widget.lesson.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson Detail")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<LessonDetailBloc, LessonDetailState>(
          listener: (context, state) {
            if (state is LessonCompleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Lesson completed successfully"),
                ),
              );
            }

            if (state is LessonDetailError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is LessonDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is LessonStepsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is LessonDetailLoaded ||
                state is LessonCompletionLoading ||
                state is LessonCompleted) {
              final lesson = (state is LessonDetailLoaded)
                  ? state.lesson
                  : (state is LessonCompletionLoading)
                      ? state.lesson
                      : (state as LessonCompleted).lesson;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    lesson.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Description (Step content)
                  Text(
                    lesson.description,
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 30),

                  /// Status
                  // Text(
                  //   "Status: ${lesson..replaceAll("_", " ")}",
                  //   style: const TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),

                  const Spacer(),

                  /// Mark Completed Button
                  // if (lesson.status != "completed")
                  //   SizedBox(
                  //     width: double.infinity,
                  //     height: 56,
                  //     child: ElevatedButton(
                  //       onPressed: state
                  //       is LessonCompletionLoading
                  //           ? null
                  //           : () {
                  //         context
                  //             .read<LessonDetailBloc>()
                  //             .add(
                  //           MarkLessonCompleted(
                  //               lesson.id),
                  //         );
                  //       },
                  //       child: state
                  //       is LessonCompletionLoading
                  //           ? const CircularProgressIndicator(
                  //         color: Colors.white,
                  //       )
                  //           : const Text(
                  //         "Mark as Completed",
                  //         style: TextStyle(fontSize: 18),
                  //       ),
                  //     ),
                  //   ),
                ],
              );
            }

            if (state is LessonStepsLoaded) {
              return Column(
                children: [
                  /// Title
                  Text(
                    state.lesson.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Expanded(
                    flex: 1,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: state.steps.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final step = state.steps[index];

                        return Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Step ${step.stepOrder}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                step.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                step.description,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: state is LessonCompletionLoading
                          ? null
                          : () {
                              context.read<LessonDetailBloc>().add(
                                    MarkLessonCompleted(),
                                  );
                            },
                      child: state is LessonCompletionLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Mark as Completed",
                              style: TextStyle(fontSize: 18),
                            ),
                    ),
                  ),
                ],
              );
            }

            if (state is LessonDetailError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
