import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  void showBottomSnackBar(
      BuildContext context, bool isFailure, String message) {
    if (isFailure)
      showModalBottomSheet(
        context: context,
        elevation: 4,
        builder: (context) => Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height / 10,
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height / 42,
            12,
            MediaQuery.of(context).size.height / 42,
            0,
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    else
      showModalBottomSheet(
        context: context,
        elevation: 4,
        builder: (context) => Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height / 10,
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height / 42,
            12,
            MediaQuery.of(context).size.height / 42,
            0,
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
  }
}
