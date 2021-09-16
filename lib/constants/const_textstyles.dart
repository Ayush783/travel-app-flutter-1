import "package:flutter/material.dart";

TextStyle styleText(Color col, FontWeight wei, double size) {
  return TextStyle(
      color: col, fontWeight: wei, fontSize: size, fontFamily: 'IBM');
}

TextStyle headingStyle() {
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: "Comfortaa",
    fontSize: 24,
  );
}
