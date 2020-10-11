import 'package:attendance_calc/screens/statistics_screen.dart';
import 'package:attendance_calc/screens/home_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:attendance_calc/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
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
  int i;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut)
      ..addListener(() {
        setState(() {
          i = (animation.value * 100).round();
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await animated_dialog_box.showScaleAlertBox(
                context: context,
                icon: Icon(
                  Icons.warning,
                  size: 30,
                ),
                title: Text("RESET"),
                yourWidget: Center(
                  child: Container(
                    child: Text(
                      "All of your data will be reset",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                firstButton: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print("Data get reset");
                    Navigator.of(context).pop();
                  },
                ),
                secondButton: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ));
          },
          elevation: 2.5,
          tooltip: "Reset",
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Theme.of(context).primaryColor,
          notchMargin: 7.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentTab,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).accentColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.insert_chart,
                  ),
                  title: Text("Statistics"))
            ],
            onTap: (index) {
              setState(() {
                _currentTab = index;
                pageController.animateToPage(_currentTab,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              });
            },
          ),
        ),
        body: PageView(
          physics: ClampingScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _currentTab = index;
            });
          },
          children: <Widget>[HomeScreen(), StatisticsScreen()],
        ));
  }
}
