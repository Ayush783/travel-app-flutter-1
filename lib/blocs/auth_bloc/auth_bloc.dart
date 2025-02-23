import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:travel_app/models/user_model.dart';
import 'package:travel_app/services/firebase_auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  static final FirebaseaAuthService _firebaseaAuthService =
      FirebaseaAuthService();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    //sign in event
    if (event is SignInWithEmail) {
      yield AuthStarted();
      final UserModel userModel = await _firebaseaAuthService.signInWithEmail(
          event.email, event.password);
      if (userModel.error!)
        yield AuthFailure(userModel.errorMessage!);
      else
        yield AuthSuccess(event.context);
    }
    //sign up event
    else if (event is SignUpWithEmail) {
      yield AuthStarted();
      final UserModel userModel = await _firebaseaAuthService.signUpWithEmail(
          event.email, event.password);
      if (userModel.error!)
        yield AuthFailure(userModel.errorMessage!);
      else
        yield EmailLinkSent();
    } else if (event is SignInWithGoogle) {
      yield AuthStarted();
      final userModel = await _firebaseaAuthService.signInWithGoogle();
      if (userModel.error!)
        yield AuthFailure(userModel.errorMessage!);
      else
        yield AuthSuccess(event.context);
    } else if (event is SignOut) {
      yield Signingout();
      await _firebaseaAuthService.signOut();
      yield SignedOut(event.context);
    } else if (event is SignInWithFacebook) {
      yield AuthStarted();
      final UserModel userModel = await _firebaseaAuthService.signInWithFb();
      if (userModel.error!)
        yield AuthFailure(userModel.errorMessage!);
      else {
        if (userModel.errorMessage == 'EMAIL_VERIFICATION_LINK_SENT')
          yield EmailLinkSent();
        else
          yield AuthSuccess(event.context);
      }
    }
  }
}
