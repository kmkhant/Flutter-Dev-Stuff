import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("images/i_am_rich_app_icon.png"),
          ),
          Text(
            "Sayar Gee",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Flutter Developer",
              style: TextStyle(
                  fontSize: 15, color: Colors.white, letterSpacing: 2.5)),
          SizedBox(
            height: 20,
            width: 150,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'kael@gmail.com',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal.shade900,
                  ),
                ),
              )),
          Center(
              child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "+959 776 766 707",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 20,
                      ),
                    ),
                  )))
        ],
      )),
    ));
  }
}
