/// This application follows a clean architecture pattern with the following layers:
/// - Presentation (UI)
/// - Domain (Business Logic)
/// - Data (Repository and Data Sources)
///
/// The app uses:
/// - HydratedBloc for persistent state management
/// - Material 3 for theming and design
/// - Go Router for navigation
/// - Clean Architecture principles
///
/// Copyright (c) 2024. All rights reserved.
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:x_clone/bloc/auth_bloc.dart';
import 'package:x_clone/bloc/tweet_bloc.dart';
import 'package:x_clone/core/core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:x_clone/core/dependency_injection.dart';

/// Application entry point
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase if not already initialized
  await Firebase.initializeApp();

  setupDependencyInjection();

  // Set up system configurations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Initialize HydratedBloc storage
  final directory = await getApplicationDocumentsDirectory();

  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );

  HydratedBloc.storage = storage;

  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
          lazy: false,
        ),
        BlocProvider(create: (context) => getIt<TweetBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'My App',
            theme: state.createLightTheme(context),
            darkTheme: state.createDarkTheme(context),
            themeMode: state.themeMode,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
