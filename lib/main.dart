import 'package:app_social/blocs/post_bloc.dart';
import 'package:app_social/blocs/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/landing_screen.dart';
import './repositories/post_repository.dart';
import './repositories/user_repository.dart';

final getIt = GetIt.instance;

void main() {
  setupDependencies();
  runApp(const MyApp());
}

void setupDependencies() {
  debugPrint("Setting up dependencies...");
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<PostRepository>(() => PostRepositoryImpl());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
            create: (context) =>
                UserBloc(getIt<UserRepository>())..add(LoadUserEvent())),
        BlocProvider<PostBloc>(
            create: (context) =>
                PostBloc(getIt<PostRepository>())..add(LoadPostsEvent())),
      ],
      child: MaterialApp(
        title: 'Social App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LandingScreen(),
      ),
    );
  }
}
