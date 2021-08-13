import 'package:flutter/material.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/ui/sign_in_screen.dart';
import 'package:travel_app/ui/sign_up_screen.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
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
                                  builder: (BuildContext) => SignUpScreen()));
                        },
                        child: Text("Sign Up")),
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext) => SignInScreen()));
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
