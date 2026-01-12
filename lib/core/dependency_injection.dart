import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/tweet_bloc.dart';
import '../data/firebase_auth_service.dart';
import '../data/firestore_service.dart';
import '../repositories/auth_repository.dart';
import '../repositories/tweet_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Services
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => FirestoreService());

  // Register Firebase instances
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => FirebaseAuth.instance);

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<TweetRepository>(
    () => TweetRepositoryImpl(getIt()),
  );

  // Blocs
  getIt.registerFactory(() => AuthBloc(getIt()));
  getIt.registerFactory(() => TweetBloc(getIt()));
}
