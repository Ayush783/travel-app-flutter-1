part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInWithEmail extends AuthEvent {
  final String email, password;
  final BuildContext context;

  SignInWithEmail(this.email, this.password, this.context);
}

class SignUpWithEmail extends AuthEvent {
  final String email, password;

  SignUpWithEmail(this.email, this.password);
}

class SignInWithGoogle extends AuthEvent {
  final BuildContext context;

  SignInWithGoogle(this.context);
}

class SignInWithFacebook extends AuthEvent {
  final BuildContext context;

  SignInWithFacebook(this.context);
}

class SignOut extends AuthEvent {
  final BuildContext context;

  SignOut(this.context);
}
