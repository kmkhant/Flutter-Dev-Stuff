import 'package:attendance_calc/models/charts_data.dart';
import 'package:attendance_calc/models/charts.dart';
import 'package:attendance_calc/screens/animated_chartdata.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new FlutterLogo(
          colors: Colors.blue,
          size: 30,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.grey,
          ),
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            onPressed: () {},
            icon: Icon(Icons.add, size: 25),
            color: Colors.grey,
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment(0.0, -0.40),
                height: 100.0,
                color: Colors.white,
                child: Text(
                  "Statistics for August",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 90, 25, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(blurRadius: 2.0, color: Colors.grey)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 5, 5, 0),
                          child: Text(
                            'Available',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 5, 5),
                          child: Text(
                            '35',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    FlatButton(
                      child: Text(
                        "RESET",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      color: Colors.red,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subjects",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 4.0,
            padding: EdgeInsets.fromLTRB(25, 0, 25, 40),
            shrinkWrap: true,
            children: [_buildCard(0)],
          ),
          Container(
            height: 60,
          )
        ],
      ),
    );
  }
}

Widget _buildCard(int index) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 7.0,
    child: Stack(
      children: [
        Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              Chart().getSubjectName(index),
              style: TextStyle(fontSize: 15),
            ),
            Container(
              /// Chart is inserted here
              child: PercentageChart(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.green,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        /// add
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.green,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
