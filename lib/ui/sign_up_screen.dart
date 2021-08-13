import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travelling App"),
        backgroundColor: Color(0xF217242D),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/sign.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
