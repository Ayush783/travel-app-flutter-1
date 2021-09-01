part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInWithEmail extends AuthEvent {
  final String email, password;

  SignInWithEmail(this.email, this.password);
}

class SignUpWithEmail extends AuthEvent {
  final String email, password;

  SignUpWithEmail(this.email, this.password);
}

class SignInWithGoogle extends AuthEvent {}

class SignInWithFacebook extends AuthEvent {}
