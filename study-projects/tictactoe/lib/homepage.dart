import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                              crossAxisSpacing: 9,
                              mainAxisSpacing: 9),
                      itemCount: 9,
                      itemBuilder: (context, i) => new SizedBox(
                            width: 100,
                            height: 100,
                            child: RaisedButton(
                              padding: const EdgeInsets.all(8),
                              onPressed: () {},
                              child: Text(
                                "T",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ))),
              RaisedButton(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    "RESET",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    print("Button Pressed");
                  })
            ]));
  }
}
