import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../core/errors/auth_failure.dart';
import '../models/user_model.dart';
import '../data/firebase_auth_service.dart';
import '../data/firestore_service.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, UserModel>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<AuthFailure, UserModel>> registerWithEmailAndPassword(
    String email,
    String password, {
    String? displayName,
  });
  Future<void> signOut();
  Stream<UserModel?> get currentUser;
}

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _authService;
  final FirestoreService _firestoreService;

  AuthRepositoryImpl(this._authService, this._firestoreService);

  @override
  Future<Either<AuthFailure, UserModel>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final result = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.fold((failure) => left(failure), (user) async {
        debugPrint('Successfully signed in user: ${user.uid}');
        final userModel = await _firestoreService.getUser(user.uid);
        if (userModel == null) {
          debugPrint('User document not found in Firestore');
          return left(const AuthFailure.serverError());
        }
        return right(userModel);
      });
    } catch (e) {
      debugPrint('Error during sign in: $e');
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, UserModel>> registerWithEmailAndPassword(
    String email,
    String password, {
    String? displayName,
  }) async {
    try {
      final result = await _authService.registerWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.fold((failure) => left(failure), (user) async {
        debugPrint('Successfully registered user: ${user.uid}');
        final userModel = UserModel(
          uid: user.uid,
          email: email,
          displayName: displayName,
          createdAt: DateTime.now(),
        );

        try {
          await _firestoreService.createUser(userModel);
          debugPrint('Successfully created user document in Firestore');
          return right(userModel);
        } catch (e) {
          debugPrint('Error creating user document: $e');
          // Clean up the auth account if Firestore creation fails
          await _authService.signOut();
          return left(const AuthFailure.serverError());
        }
      });
    } catch (e) {
      debugPrint('Error during registration: $e');
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _authService.signOut();
      debugPrint('Successfully signed out');
    } catch (e) {
      debugPrint('Error during sign out: $e');
    }
  }

  @override
  Stream<UserModel?> get currentUser {
    return _authService.authStateChanges.asyncMap((user) async {
      if (user == null) {
        debugPrint('Auth state changed: No user');
        return null;
      }
      debugPrint('Auth state changed: User ${user.uid}');
      try {
        final userModel = await _firestoreService.getUser(user.uid);
        if (userModel == null) {
          debugPrint('User document not found for ${user.uid}');
        }
        return userModel;
      } catch (e) {
        debugPrint('Error fetching user document: $e');
        return null;
      }
    });
  }
}
