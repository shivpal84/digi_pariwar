import 'package:digi_pariwar/features/lesson/presentation/lesson_list/lessons_list_screen.dart';
import 'package:digi_pariwar/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/lesson/domain/lesson_repository.dart';
import 'features/lesson/presentation/lesson_list/bloc/lessons_bloc.dart';
import 'features/profile/domain/profile_repository.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'network/api_client.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Digi Pariwar',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ProfileScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();

    return MultiRepositoryProvider(
      providers: [
        /// Profile Repository
        RepositoryProvider<ProfileRepository>(
          create: (_) => ProfileRepositoryImpl(apiClient),
        ),

        /// Lessons Repository
        RepositoryProvider(
          create: (_) => LessonsRepositoryImpl(apiClient),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          /// Profile Bloc
          BlocProvider(
            create: (context) => ProfileBloc(
              context.read<ProfileRepository>(),
            ),
          ),

          /// Lessons Bloc
          BlocProvider(
            create: (context) => LessonsBloc(
              context.read<LessonsRepositoryImpl>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DigiParivaar MVP',
          theme: ThemeData(
            useMaterial3: true,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 18),
              titleLarge: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
          ),

          /// 👇 Load Profile Screen First
          initialRoute: '/profile',

          routes: {
            '/profile': (_) => const ProfileScreen(),
            '/lessons': (_) => const LessonsListScreen(),
          },
        ),
      ),
    );
  }
}
