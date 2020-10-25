import 'package:attendance_calc/utilities/custom_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:attendance_calc/utilities/styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentTab = 0;
  int _numTabs = 1;

  final _tabs = <Widget>[
    Text(
      "Home",
      style: kTitleStyle,
    ),
    Text("Calendar")
  ];

  Animation<double> animation;
  AnimationController _controller;
  int i = 75;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 10,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff20253d)),
              ),
              Positioned(
                top: 15,
                right: MediaQuery.of(context).size.width / 3,
                child: Text(
                  "SmartSkip",
                  style: TextStyle(color: Colors.white, fontSize: 27),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 5))
                        ]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.directions_run,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: 13),
                            Text(
                              "42",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "skippable sessions",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              "Subjects",
              style: TextStyle(fontSize: 20, color: Colors.black45),
            ),
          ),
          SizedBox(height: 6),
          // generated charts here
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 430,
            child: GridView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                buildCard(i),
                buildCard(i),
                buildCard(i),
                buildCard(i),
                buildCard(i),
                buildCard(i),
                buildAddCard()
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 16 / 9),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddCard() {
    return GestureDetector(
      onTap: () {
        print("Add Subject Tapped");
      },
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          )),
        ),
      ),
    );
  }

  Widget buildCard(int percent) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "4011",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.settings),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                        onPressed: () {
                          print("adjust");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox();
                              });
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Adjust",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: <Widget>[
                buildIndicator(percent),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      elevation: 2.5,
                      onPressed: () {
                        print("Pressed Plus");
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        size: 24,
                      ),
                      shape: CircleBorder(),
                    ),
                    RaisedButton(
                      elevation: 2.5,
                      onPressed: () {
                        print("Pressed Minus");
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Icon(
                        Icons.remove,
                        size: 24,
                      ),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(int percent) {
    return CircularPercentIndicator(
      radius: 100,
      animation: true,
      animationDuration: 1000,
      lineWidth: 10.0,
      percent: 0.75,
      animateFromLastPercent: true,
      center: Text(
        "$percent%",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.grey[200],
    );
  }
}
