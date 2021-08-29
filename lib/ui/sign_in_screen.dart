import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  Color _col1 = Colors.white;
  Color _col2 = Color(0xFF008665);
  Color _col = Colors.white;
  Color _colp = Colors.white;
  var _formKey1 = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          image: ExactAssetImage("assets/images/sign.jpg"),
        )),
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              // padding: EdgeInsets.only(top: 25),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        Wrap(children: [
                          Text(
                            "Login and explore your favourite destinations.",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                fontFamily: 'IBM'),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: "IBM",
                                    fontWeight: FontWeight.w800,
                                  )),
                              TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(
                                    color: Color(0xFF008665),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
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
                                  // height: 100,
                                  width: double.infinity,
                                  // color: Colors.blue,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "OR",
                                        style: TextStyle(
                                          fontFamily: "IBM",
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text(
                                          "Log in via:",
                                          style: TextStyle(
                                            fontFamily: "IBM",
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                print("Press Google");
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: ExactAssetImage(
                                                        "assets/icons/google.png"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                print("facebook");
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: ExactAssetImage(
                                                          "assets/icons/facebook.png"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                child: Form(
                                  key: _formKey1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email Address",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "IBM",
                                          fontSize: 14,
                                        ),
                                      ),
                                      Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() {
                                            _col = hasFocus ? _col2 : _col1;
                                          });
                                        },
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _email,
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                    .hasMatch(value)) {
                                              return 'Enter a valid email!';
                                            }
                                            return null;
                                          },
                                          autofocus: true,
                                          style: TextStyle(
                                            color: _col,
                                            fontFamily: "IBM",
                                            fontSize: 16,
                                          ),
                                          cursorColor: _col2,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: _col),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: _col),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.mail,
                                              color: _col,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Password",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "IBM",
                                          fontSize: 14,
                                        ),
                                      ),
                                      Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() {
                                            _colp = hasFocus ? _col2 : _col1;
                                          });
                                        },
                                        child: TextFormField(
                                          controller: _pass,
                                          obscureText: true,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          autofocus: true,
                                          style: TextStyle(
                                            color: _colp,
                                            fontFamily: "IBM",
                                            fontSize: 16,
                                          ),
                                          cursorColor: Color(0xF217242D),
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: _colp),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: _colp),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: _colp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "Forgot password?",
                                        style: TextStyle(
                                          color: _col2,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "IBM",
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
                                      backgroundColor: _col2,
                                      child: Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      onPressed: () {},
                                    ),
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
            ),
          ),
        ]),
      ),
    );
  }
}
