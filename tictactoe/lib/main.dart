import 'package:flutter/material.dart';
import 'package:tictactoe/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData.dark(),
      home: new HomePage(),
    );
  }
}
