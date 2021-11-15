part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthStarted extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}

class AuthSuccess extends AuthState {
  final BuildContext context;

  AuthSuccess(this.context);
}

class EmailLinkSent extends AuthState {}

class SignedOut extends AuthState {
  final BuildContext context;

  SignedOut(this.context);
}

class Signingout extends AuthState {}
