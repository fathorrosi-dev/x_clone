import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/user_model.dart';
import '../repositories/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<UserModel?>? _userSubscription;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (e) async {
          emit(const AuthState.loading());

          // Cancel any existing subscription
          await _userSubscription?.cancel();

          // Start listening to auth changes
          _userSubscription = _authRepository.currentUser.listen(
            (user) {
              if (user != null) {
                add(AuthEvent.authUserChanged(user));
              } else {
                add(const AuthEvent.authUserChanged(null));
              }
            },
            onError: (error) {
              emit(AuthState.error(error.toString()));
              emit(const AuthState.unauthenticated());
            },
          );
        },
        authUserChanged: (e) async {
          if (e.user == null) {
            emit(const AuthState.unauthenticated());
          } else {
            emit(AuthState.authenticated(e.user!));
          }
        },
        signedOut: (e) async {
          emit(const AuthState.loading());
          await _authRepository.signOut();
          emit(const AuthState.unauthenticated());
        },
        emailAndPasswordSignIn: (e) async {
          emit(const AuthState.loading());
          final failureOrSuccess = await _authRepository
              .signInWithEmailAndPassword(e.email, e.password);
          failureOrSuccess.fold(
            (failure) => emit(AuthState.error(failure.toString())),
            (user) => emit(AuthState.authenticated(user)),
          );
        },
        emailAndPasswordRegister: (e) async {
          emit(const AuthState.loading());
          final failureOrSuccess = await _authRepository
              .registerWithEmailAndPassword(
                e.email,
                e.password,
                displayName: e.displayName,
              );
          failureOrSuccess.fold(
            (failure) => emit(AuthState.error(failure.toString())),
            (user) => emit(AuthState.authenticated(user)),
          );
        },
      );
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription?.cancel();
    return super.close();
  }
}
