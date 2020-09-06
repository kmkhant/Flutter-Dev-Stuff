import 'package:attendance_calc/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_calc/models/charts_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ChartData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendance Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingPage(),
      ),
    );
  }
}
