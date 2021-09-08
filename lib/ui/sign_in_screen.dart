import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_decorations.dart';
import 'package:travel_app/constants/const_textstyles.dart';
import 'package:travel_app/ui/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  Color _col = whi;
  Color _colp = whi;
  var _formKey1 = GlobalKey<FormState>();
  @override
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
                          Text("Login and explore your favourite destinations.",
                              style: styleText(whi, FontWeight.w700, 20)),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Don't have an account? ",
                                  style: styleText(whi, FontWeight.w800, 14)),
                              TextSpan(
                                  text: "Sign up",
                                  style: styleText(gre, FontWeight.w800, 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()));
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
                                  // height: 100,
                                  width: double.infinity,
                                  // color: Colors.blue,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "OR",
                                        style:
                                            styleText(whi, FontWeight.w800, 14),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text("Log in via:",
                                            style: styleText(
                                                whi, FontWeight.w800, 14)),
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
                                                child: SvgPicture.asset(
                                                    "assets/icons/facebook.svg"),
                                                decoration: BoxDecoration(
                                                  // image: DecorationImage(
                                                  //   image: ExactAssetImage(
                                                  //       "assets/icons/google.png"),
                                                  //   fit: BoxFit.cover,
                                                  // ),
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
                                                child: SvgPicture.asset(
                                                    "assets/icons/facebook.svg"),
                                                decoration: BoxDecoration(
                                                    // image: DecorationImage(
                                                    //   image: ExactAssetImage(
                                                    //       "assets/icons/facebook.png"),
                                                    //   fit: BoxFit.cover,
                                                    // ),
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
                                      Text("Email Address",
                                          style: styleText(
                                              whi, FontWeight.w800, 14)),
                                      Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() {
                                            _col = hasFocus ? gre : whi;
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
                                          style: styleText(
                                              _col, FontWeight.normal, 16),
                                          cursorColor: gre,
                                          decoration:
                                              fieldText(_col, Icons.mail),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Password",
                                        style:
                                            styleText(whi, FontWeight.w800, 14),
                                      ),
                                      Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() {
                                            _colp = hasFocus ? gre : whi;
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
                                            decoration:
                                                fieldText(_colp, Icons.lock)),
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
                                        style:
                                            styleText(gre, FontWeight.w800, 14),
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
                                      backgroundColor: gre,
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
