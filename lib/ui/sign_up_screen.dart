import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_decorations.dart';
import 'package:travel_app/constants/const_textstyles.dart';
import 'package:travel_app/ui/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _cnfpass = new TextEditingController();
  bool check = false;
  Color col = white;
  Color colp = white;
  Color colcp = white;
  var _formKey = GlobalKey<FormState>();
  bool _isValid() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    _formKey.currentState!.save();
    return true;
  }

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
                        Text("Get started.",
                            style:
                                styleText(Colors.white, FontWeight.w700, 20)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Already have an account? ",
                                  style: styleText(white, FontWeight.w800, 14)),
                              TextSpan(
                                  text: "Log in",
                                  style: styleText(green, FontWeight.w800, 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
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
                                  // height: 100,
                                  width: double.infinity,
                                  // color: Colors.blue,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "OR",
                                        style: styleText(
                                            white, FontWeight.w800, 14),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text("Sign up with:",
                                            style: styleText(
                                                white, FontWeight.w800, 14)),
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
                                                  "assets/icons/google.svg",
                                                  fit: BoxFit.fill,
                                                ),
                                                decoration: BoxDecoration(
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
                                height: 10,
                              ),
                              Container(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Email Address",
                                          style: styleText(
                                              white, FontWeight.w800, 14)),
                                      Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() {
                                            col = hasFocus ? green : white;
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
                                              col, FontWeight.normal, 16),
                                          cursorColor: green,
                                          decoration:
                                              fieldText(col, Icons.mail),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Password",
                                        style: styleText(
                                            white, FontWeight.w800, 14),
                                      ),
                                      Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() {
                                            colp = hasFocus ? green : white;
                                          });
                                        },
                                        child: TextFormField(
                                            controller: _pass,
                                            obscureText: true,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            autofocus: true,
                                            style: styleText(
                                                colp, FontWeight.normal, 16),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Enter a valid password!';
                                              }
                                              return null;
                                            },
                                            cursorColor: green,
                                            decoration:
                                                fieldText(colp, Icons.lock)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Confirm Password",
                                          style: styleText(
                                              white, FontWeight.w800, 14)),
                                      Focus(
                                        onFocusChange: (hasFocus) {
                                          setState(() {
                                            colcp = hasFocus ? green : white;
                                          });
                                        },
                                        child: TextFormField(
                                            obscureText: true,
                                            controller: _cnfpass,
                                            cursorColor: Color(0xF217242D),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            autofocus: true,
                                            style: styleText(
                                                colcp, FontWeight.normal, 16),
                                            validator: (value) {
                                              if (value != _pass.text) {
                                                return "Password Mismatch";
                                              }
                                              return null;
                                            },
                                            decoration:
                                                fieldText(colcp, Icons.lock)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Theme(
                                    data:
                                        ThemeData(unselectedWidgetColor: white),
                                    child: Checkbox(
                                        value: check,
                                        checkColor: green,
                                        activeColor: white,
                                        onChanged: (val) {
                                          setState(() {
                                            check = !check;
                                            print(check);
                                          });
                                        }),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "I agree to ",
                                        style: styleText(
                                            white, FontWeight.w800, 14),
                                      ),
                                      TextSpan(
                                        text: "Terms",
                                        style: styleText(
                                            green, FontWeight.w800, 14),
                                      ),
                                      TextSpan(
                                        text: " & ",
                                        style: styleText(
                                            white, FontWeight.w800, 14),
                                      ),
                                      TextSpan(
                                        text: "Conditions",
                                        style: styleText(
                                            green, FontWeight.w800, 14),
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
                                      backgroundColor: green,
                                      child: Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      onPressed: () {
                                        if (_isValid()) {
                                          print("Ready to go!!");
                                        } else {
                                          print("Errros!!");
                                        }
                                      },
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
