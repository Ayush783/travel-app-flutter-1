import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_textstyles.dart';
import 'package:travel_app/services/utility.dart';
import 'package:travel_app/ui/auth/sign_in_screen.dart';
import 'package:travel_app/ui/auth/widgets/social_media_button.dart';
import 'package:travel_app/ui/auth/widgets/text_input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _cnfpass = new TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  final FocusNode _cnfPassNode = FocusNode();
  bool check = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Utility utils = Utility();
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
    final size = MediaQuery.of(context).size;
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
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 8,
              vertical: size.height / 16,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.29,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF17242D).withOpacity(0.8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get Started.",
                      style: styleText(Colors.white, FontWeight.w700, 20)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: styleText(whi, FontWeight.w800, 14)),
                        TextSpan(
                            text: "Log in",
                            style: styleText(gre, FontWeight.w800, 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                              })
                      ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "OR",
                      style: styleText(whi, FontWeight.w800, 14),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Sign up with:",
                          style: styleText(whi, FontWeight.w800, 14)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialMediaButton(
                          key: UniqueKey(),
                          onTap: () {
                            print("google");
                          },
                          imgUrl: "assets/icons/google.png",
                        ),
                        SocialMediaButton(
                          key: UniqueKey(),
                          onTap: () {
                            print("facebook");
                          },
                          imgUrl: "assets/icons/facebook.svg",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email Address",
                            style: styleText(whi, FontWeight.w800, 14)),
                        //email field
                        TextInputField(
                          controller: _email,
                          icon: Icons.mail,
                          isObsecure: false,
                          validate: utils.validateEmail,
                          node: _emailNode,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password",
                          style: styleText(whi, FontWeight.w800, 14),
                        ),
                        //password field
                        TextInputField(
                          controller: _pass,
                          icon: Icons.lock,
                          isObsecure: true,
                          validate: utils.validatePassword,
                          node: _passNode,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Confirm Password",
                            style: styleText(whi, FontWeight.w800, 14)),
                        //confirm password field
                        TextInputField(
                          controller: _cnfpass,
                          icon: Icons.lock,
                          isObsecure: false,
                          node: _cnfPassNode,
                          validate: (value) {
                            return utils.validateConfirmPassword(value, _pass);
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: check,
                          checkColor: gre,
                          activeColor: whi,
                          side: BorderSide(color: Colors.white, width: 2),
                          onChanged: (val) {
                            setState(() {
                              check = !check;
                              print(check);
                            });
                          }),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "I agree to ",
                            style: styleText(whi, FontWeight.w800, 14),
                          ),
                          TextSpan(
                            text: "Terms",
                            style: styleText(gre, FontWeight.w800, 14),
                          ),
                          TextSpan(
                            text: " & ",
                            style: styleText(whi, FontWeight.w800, 14),
                          ),
                          TextSpan(
                            text: "Conditions",
                            style: styleText(gre, FontWeight.w800, 14),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FloatingActionButton(
                        backgroundColor: gre,
                        child: Icon(Icons.arrow_forward_ios_outlined),
                        onPressed: () {
                          if (_isValid()) {
                            print("Ready to go!!");
                          } else {
                            print("Errros!!");
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
