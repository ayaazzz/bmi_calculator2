import 'package:bmi_calculator2/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator2/screens/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       
      home:  LoginScreen()
    );

  }


}