import 'package:flutter/material.dart';
import 'package:travel_app/ui/home_screen.dart';
import 'package:travel_app/ui/sign_in_screen.dart';
import 'package:travel_app/ui/sign_up_screen.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(primaryColor: Color(0xFF008665)),
      home: HomeScreen(),
    );
  }
}
