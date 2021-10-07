import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:travel_app/ui/auth/sign_in_screen.dart';
import 'package:travel_app/ui/auth/sign_up_screen.dart';

enum Screen {
  Signin,
  Signup,
}

class AuthBlocProvider extends StatelessWidget {
  const AuthBlocProvider({Key? key, this.screen}) : super(key: key);

  final Screen? screen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: screen == Screen.Signin ? SignInScreen() : SignUpScreen(),
    );
  }
}
