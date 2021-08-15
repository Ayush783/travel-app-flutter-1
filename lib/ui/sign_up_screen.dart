import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/ui/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    bool check = false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Travelling App"),
        backgroundColor: Color(0xF217242D),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/sign.jpg"),
            )),
            child: Container(
              padding: EdgeInsets.only(top: 25),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.29,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF17242D).withOpacity(0.8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'IBM'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              TextSpan(
                                  text: "Log in",
                                  style: TextStyle(
                                    color: Color(0xF217242D),
                                    fontSize: 14,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext) =>
                                                  SignInScreen()));
                                    })
                            ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/icons/google.png")),
                                    ),
                                    Text(
                                      "Sign up with Google",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Color(0xFF3C5A9A),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/icons/facebook.png")),
                                    ),
                                    Text(
                                      "Sign up with Facebook",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email Address",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextField(
                                      cursorColor: Color(0xF217242D),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.mail,
                                          color: Colors.black,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xF217242D)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextField(
                                      obscureText: true,
                                      cursorColor: Color(0xF217242D),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xF217242D)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Confirm Password",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextField(
                                      obscureText: true,
                                      cursorColor: Color(0xF217242D),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.black,
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xF217242D)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: check,
                                      onChanged: (value) {
                                        setState(() {
                                          check = !check;
                                        });
                                      }),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "I agree to ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          )),
                                      TextSpan(
                                        text: "Terms",
                                        style: TextStyle(
                                          color: Color(0xF217242D),
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                          text: " & ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          )),
                                      TextSpan(
                                        text: "Conditions",
                                        style: TextStyle(
                                          color: Color(0xF217242D),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: FloatingActionButton(
                                        backgroundColor: Color(0xFF2A3D66),
                                        child: Icon(
                                            Icons.arrow_forward_ios_outlined),
                                        onPressed: () {}),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
