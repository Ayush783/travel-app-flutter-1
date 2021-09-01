import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final User? user;
  final bool? error;
  final String? errorMessage;
  //default constructor
  UserModel(
      {@required this.user,
      this.error = false,
      this.errorMessage = 'NO_ERROR'});

  //sign up failure constructor
  UserModel.failure({@required String? errorMessage})
      : user = null,
        error = true,
        errorMessage = errorMessage;

  //sent email verification constructor
  UserModel.sentEmailLink()
      : user = null,
        error = false,
        errorMessage = 'NO_ERROR';

  //email not verified constructor
  UserModel.unverifiedEmail()
      : user = null,
        error = true,
        errorMessage = 'EMAIL_NOT_VERIFIED';
}
