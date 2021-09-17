import 'package:flutter/cupertino.dart';

class Utility {
  String? validateEmail(String? value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return 'Enter a valid email!';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Enter a valid password!';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, TextEditingController _pass) {
    if (value != _pass.text) {
      return "Password Mismatch";
    }
    return null;
  }
}
