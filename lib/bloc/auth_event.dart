part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthEvent.authUserChanged(UserModel? user) = AuthUserChanged;
  const factory AuthEvent.signedOut() = SignedOut;
  const factory AuthEvent.emailAndPasswordSignIn({
    required String email,
    required String password,
  }) = EmailAndPasswordSignIn;
  const factory AuthEvent.emailAndPasswordRegister({
    required String email,
    required String password,
    String? displayName,
  }) = EmailAndPasswordRegister;
}
