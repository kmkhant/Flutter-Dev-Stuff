import 'package:attendance_calc/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [
      SizedBox(
        height: 30,
      )
    ];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }

    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
            color: isActive ? Colors.white : Color(0xFF7B51D3),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: kBoxDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: () => print('skip'),
                      child: _currentPage != _numPages - 1
                          ? Text(
                              "Skip",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400),
                            )
                          : Text("")),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      createOnboardPage(
                          'assets/images/onboarding0.png',
                          'Connect people\naround the world',
                          'Lorem ipsumj dolor sit amet, consect adipiscing elit, sed do eiusmod tempor'),
                      createOnboardPage(
                          'assets/images/onboarding1.png',
                          'Live your life smarter\nwith us!',
                          'Lorem ipsumj dolor sit amet, consect adipiscing elit, sed do eiusmod tempor'),
                      createOnboardPage(
                          'assets/images/onboarding2.png',
                          'Get a new experience\nof imagination',
                          'Lorem ipsumj dolor sit amet, consect adipiscing elit, sed do eiusmod tempor')
                    ],
                  ),
                ),
                _currentPage != _numPages - 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      )
                    : _buildFooter(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildFooter(BuildContext context) {
  return GestureDetector(
    onTap: () {
      print("Get Started");
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ]),
      width: MediaQuery.of(context).size.width * .85,
      height: 60,
      child: Center(
        child: Text(
          'Get Started',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    ),
  );
}

Widget createOnboardPage(String imageLocation, String title, String subtitle) {
  return Padding(
    padding: EdgeInsets.all(40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Image(
            image: AssetImage('$imageLocation'),
            height: 250.0,
            width: 250.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          '$title',
          style: kSubtitleStyle,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Lorem ipsumj dolor sit amet, consect adipiscing elit, sed do eiusmod tempor',
          style: kSubtitleStyle,
        )
      ],
    ),
  );
}
