import 'package:attendance_calc/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:attendance_calc/screens/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrackX',
      theme: ThemeData(
        buttonColor: Color(0xff68d69d),
        primaryColor: Color(0xff20253d),
        accentColor: Color(0xffcdd2de),
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            headline4: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
            headline6: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w100,
                color: Colors.white,
                letterSpacing: 1.3)),
      ),
      home: LandingPage(),
    );
  }
}
