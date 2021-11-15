import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_textstyles.dart';
import 'package:travel_app/services/utility.dart';
import 'package:travel_app/ui/auth/sign_up_screen.dart';
import 'package:travel_app/ui/auth/widgets/social_media_button.dart';

import 'widgets/text_input_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  final Utility utils = Utility();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: 'form key');
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();
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
            width: MediaQuery.of(context).size.width / 1.29,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            margin: EdgeInsets.fromLTRB(
                size.width / 8, size.width / 4, size.width / 8, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF17242D).withOpacity(0.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login and explore your favourite destinations.",
                    style: styleText(white, FontWeight.w700, 20)),
                //sign up screen nav
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: styleText(white, FontWeight.w800, 14)),
                      TextSpan(
                          text: "Sign up",
                          style: styleText(green, FontWeight.w800, 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            })
                    ]),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "OR",
                    style: styleText(white, FontWeight.w800, 14),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Log in via:",
                        style: styleText(white, FontWeight.w800, 14)),
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
                          context
                              .read<AuthBloc>()
                              .add(SignInWithGoogle(context));
                        },
                        imgUrl: "assets/icons/google.png",
                      ),
                      SocialMediaButton(
                        key: UniqueKey(),
                        onTap: () {
                          print(2);
                          print("facebook");
                        },
                        imgUrl: "assets/icons/facebook.svg",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    print('forgot');
                  },
                  child: Text(
                    'Forgot password?',
                    style: styleText(green, FontWeight.w800, 14),
                  ),
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
                          context.read<AuthBloc>().add(
                                SignInWithEmail(
                                    _email.text, _pass.text, context),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
