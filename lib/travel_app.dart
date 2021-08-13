import 'package:flutter/material.dart';
import 'package:travel_app/main.dart';

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
                        onPressed: () {},
                        child: Text("Sign Up")),
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {},
                        child: Text("Sign In")),
                  ],
                ),
              )),
            ],
          )),
    );
  }
}
