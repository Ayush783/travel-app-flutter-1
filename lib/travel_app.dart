import 'package:flutter/material.dart';
import 'package:travel_app/ui/auth/auth_bloc_provider.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(primaryColor: Color(0xFF008665)),
      home: AuthBlocProvider(
        screen: Screen.Signin,
      ),
    );
  }
}
