import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/services/firebase_auth_service.dart';
import 'package:travel_app/services/utility.dart';
import 'package:travel_app/ui/auth/sign_in_screen.dart';
import 'package:travel_app/ui/home/home_screen.dart';

import 'blocs/auth_bloc/auth_bloc.dart';

class TravelApp extends StatelessWidget {
  TravelApp({Key? key}) : super(key: key);

  static final FirebaseaAuthService _firebaseaAuthService =
      FirebaseaAuthService();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return Scaffold(
      body: _firebaseaAuthService.isUserNull() ? SignInScreen() : HomeScreen(),
    );
  }
}

class AuthBlocProvider extends StatelessWidget {
  const AuthBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Travel App',
          theme: ThemeData(primaryColor: Color(0xFF008665)),
          home: AuthBlocListener()),
    );
  }
}

//bloc listener to know when user signs out
class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({Key? key}) : super(key: key);
  static final utils = Utility();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(state.context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        } else if (state is AuthFailure) {
          utils.showBottomSnackBar(context, true, state.errorMessage);
        } else if (state is EmailLinkSent) {
          utils.showBottomSnackBar(context, false,
              'Please verify your email, A link has been sent to you.');
        } else if (state is SignedOut) {
          Navigator.of(state.context).pushReplacement(MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ));
        }
      },
      child: TravelApp(),
    );
  }
}
