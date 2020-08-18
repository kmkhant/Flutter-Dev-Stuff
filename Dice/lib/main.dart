import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Random Dices"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red,
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 1;

  void changeDiceState() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: FlatButton(
                    onPressed: () {
                      changeDiceState();
                    },
                    child: Image.asset('images/dice$leftDiceNumber.png'))),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: FlatButton(
                    onPressed: () {
                      changeDiceState();
                    },
                    child: Image.asset('images/dice$rightDiceNumber.png'))),
          )
        ],
      ),
    );
  }
}
