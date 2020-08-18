import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
        backgroundColor:Colors.blueGrey[900], 
      ),
      backgroundColor: Colors.blueGrey[200],
      body: Center(
        child: Image(
          image: AssetImage('images/diamond.png'),
        ),
      ),
    ));
  }
}
