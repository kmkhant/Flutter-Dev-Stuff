import 'package:FlutterForms/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RealestateMM",
      theme: ThemeData(),
      home: LoginScreen(),
    );
  }
}
