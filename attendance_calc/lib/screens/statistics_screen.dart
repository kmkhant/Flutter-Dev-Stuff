import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff20253d),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Icon(
                  Icons.directions_run,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Statistics",
                  style: TextStyle(color: Colors.white, fontSize: 27),
                ),
              ],
            ),
          ),
          Container(
              height: 40,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 7,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Skipped Acitvity Calendar Oct, 2020",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )),
          Stack(children: <Widget>[
            Container(
              color: Colors.white,
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: -20,
              left: MediaQuery.of(context).size.width / 8,
              child: Container(
                color: Colors.white,
                height: 250,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 100,
                child: Center(
                  child: HeatMapCalendar(
                    input: {
                      TimeUtils.removeTime(
                          DateTime.now().subtract(Duration(days: 3))): 5,
                      TimeUtils.removeTime(
                          DateTime.now().subtract(Duration(days: 2))): 35,
                      TimeUtils.removeTime(
                          DateTime.now().subtract(Duration(days: 1))): 14,
                      TimeUtils.removeTime(DateTime.now()): 5,
                    },
                    colorThresholds: {
                      1: Colors.green[100],
                      10: Colors.green[300],
                      30: Colors.green[500]
                    },
                    weekDaysLabels: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
                    monthsLabels: [
                      "",
                      "Jan",
                      "Feb",
                      "Mar",
                      "Apr",
                      "May",
                      "Jun",
                      "Jul",
                      "Aug",
                      "Sep",
                      "Oct",
                      "Nov",
                      "Dec",
                    ],
                    squareSize: 16.0,
                    textOpacity: 0.3,
                    labelTextColor: Colors.blueGrey,
                    dayTextColor: Colors.blue[500],
                  ),
                ),
              ),
            ),
          ]),
          Container(
              height: 40,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 20,
                    width: 7,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Skip Rates",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 159,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Subjects"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Attended"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Remaining"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Total"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("CurrentPercent")
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    endIndent: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Text("4011"),
                      SizedBox(
                        width: 30,
                      ),
                      Text("5"),
                      SizedBox(
                        width: 60,
                      ),
                      Text("8"),
                      SizedBox(
                        width: 70,
                      ),
                      Text("23"),
                      SizedBox(
                        width: 30,
                      ),
                      Text("60%")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text("4011"),
                      SizedBox(
                        width: 30,
                      ),
                      Text("5"),
                      SizedBox(
                        width: 60,
                      ),
                      Text("8"),
                      SizedBox(
                        width: 70,
                      ),
                      Text("23"),
                      SizedBox(
                        width: 30,
                      ),
                      Text("70%")
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
