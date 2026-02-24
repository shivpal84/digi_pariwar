import 'package:digi_pariwar/features/lesson/data/lesson_model/lesson_model.dart';
import 'package:digi_pariwar/features/lesson/domain/lesson_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../lesson_detail/bloc/lesson_detail_bloc.dart';
import '../lesson_detail/lesson_detail_screen.dart';
import 'bloc/lesson_event.dart';
import 'bloc/lessons_bloc.dart';
import 'bloc/lessons_state.dart';

class LessonsListScreen extends StatefulWidget {
  const LessonsListScreen({super.key});

  @override
  State<LessonsListScreen> createState() => _LessonsListScreenState();
}

class _LessonsListScreenState extends State<LessonsListScreen> {

  @override
  void initState() {
    super.initState();
    context.read<LessonsBloc>().add(FetchLessons());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Lessons")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<LessonsBloc, LessonsState>(
          builder: (context, state) {

            ///  Loading
            if (state is LessonsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            ///  Error
            if (state is LessonsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LessonsBloc>().add(FetchLessons());
                      },
                      child: const Text("Retry"),
                    )
                  ],
                ),
              );
            }

            ///  Empty
            if (state is LessonsEmpty) {
              return const Center(
                child: Text(
                  "No lessons available",
                  style: TextStyle(fontSize: 18),
                ),
              );
            }

            ///  Loaded
            if (state is LessonsLoaded) {
              return ListView.separated(
                itemCount: state.lessons.length,
                separatorBuilder: (_, __) =>
                const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final lesson = state.lessons[index];

                  return _LessonCard(lesson: lesson);
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  final LessonModel lesson;

  const _LessonCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   '/lessonDetail',
        //   arguments: lesson,
        // );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => LessonDetailBloc(context.read<LessonsRepositoryImpl>(),lesson),
              child: LessonDetailScreen(lesson: lesson),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(
              lesson.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            /// Description
            Text(
              lesson.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 12),

            // /// Status Badge
            // Container(
            //   padding: const EdgeInsets.symmetric(
            //       horizontal: 12, vertical: 6),
            //   decoration: BoxDecoration(
            //     color: _statusColor(),
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: Text(
            //     lesson.status.replaceAll("_", " "),
            //     style: const TextStyle(
            //       color: Colors.white,
            //       fontSize: 14,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}