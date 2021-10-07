import 'package:flutter/material.dart';
import 'package:travel_app/constants/const_colors.dart';
import 'package:travel_app/constants/const_textstyles.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    Key? key,
    this.controller,
    this.icon,
    this.isObsecure,
    this.validate,
    this.node,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? node;
  final IconData? icon;
  final bool? isObsecure;
  final FormFieldValidator<String>? validate;

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  Color iconColor = white;

  @override
  void initState() {
    super.initState();
    widget.node!.addListener(() {
      if (widget.node!.hasFocus)
        setState(() {
          iconColor = green;
        });
      else
        setState(() {
          iconColor = white;
        });
    });
  }

  @override
  void dispose() {
    widget.node!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      obscureText: widget.isObsecure!,
      focusNode: widget.node,
      validator: widget.validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: styleText(iconColor, FontWeight.normal, 16),
      cursorColor: Colors.green,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: green, width: 3),
        ),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 3)),
        prefixIcon: Icon(
          widget.icon!,
          color: iconColor,
        ),
      ),
      onChanged: (val) {
        print(val);
      },
    );
  }
}
