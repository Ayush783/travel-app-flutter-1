import 'package:flutter/material.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                child: Column(
                  children: [
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text("Sign Up")),
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: Text("Sign In")),
                  ],
                ),
              )),
            ],
          )),
    );
  }
}
