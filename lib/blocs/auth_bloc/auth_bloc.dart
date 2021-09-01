import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_app/models/user_model.dart';
import 'package:travel_app/services/firebase_auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._firebaseaAuthService) : super(AuthInitial());

  final FirebaseaAuthService _firebaseaAuthService;

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
        yield AuthSuccess();
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
    } else {}
  }
}
