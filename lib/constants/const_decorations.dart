import 'package:flutter/material.dart';
import 'package:travel_app/constants/const_colors.dart';

InputDecoration fieldText(Color col, IconData ico) {
  return InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: col),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: col),
    ),
    prefixIcon: Icon(
      ico,
      color: col,
    ),
  );
}
