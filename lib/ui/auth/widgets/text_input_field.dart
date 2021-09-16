import 'package:flutter/material.dart';
import 'package:travel_app/constants/const_decorations.dart';
import 'package:travel_app/constants/const_textstyles.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    this.controller,
    this.icon,
    this.isObsecure,
    this.validate,
  }) : super(key: key);

  final TextEditingController? controller;
  // static final FocusNode _node = FocusNode();
  final IconData? icon;
  final bool? isObsecure;
  final FormFieldValidator<String>? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      obscureText: isObsecure!,
      // focusNode: _node,
      validator: validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: styleText(Colors.white, FontWeight.normal, 16),
      cursorColor: Colors.green,
      decoration: fieldText(Colors.white, icon!),
      onChanged: (val) {
        print(val);
      },
    );
  }
}
