import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/travel_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(TravelApp());
}
