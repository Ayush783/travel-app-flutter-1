import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/blocs/auth_bloc/auth_bloc.dart';
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
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.29,
              margin: EdgeInsets.fromLTRB(
                  size.width / 8, size.width / 2.5, size.width / 8, 0),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
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
                            style: styleText(white, FontWeight.w800, 14)),
                        TextSpan(
                            text: "Sign in",
                            style: styleText(green, FontWeight.w800, 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()));
                              })
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email Address",
                            style: styleText(white, FontWeight.w800, 14)),
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
                          style: styleText(white, FontWeight.w800, 14),
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
                            style: styleText(white, FontWeight.w800, 14)),
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
                          checkColor: green,
                          activeColor: white,
                          // borderSide: BorderSide(color: Colors.white, width: 2),
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
                            style: styleText(white, FontWeight.w800, 14),
                          ),
                          TextSpan(
                            text: "Terms",
                            style: styleText(green, FontWeight.w800, 14),
                          ),
                          TextSpan(
                            text: " & ",
                            style: styleText(white, FontWeight.w800, 14),
                          ),
                          TextSpan(
                            text: "Conditions",
                            style: styleText(green, FontWeight.w800, 14),
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
                        backgroundColor: green,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthStarted) {
                              return Container(
                                padding: EdgeInsets.all(16),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              );
                            } else
                              return Icon(Icons.arrow_forward_ios_outlined);
                          },
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate())
                            context
                                .read<AuthBloc>()
                                .add(SignUpWithEmail(_email.text, _pass.text));
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
