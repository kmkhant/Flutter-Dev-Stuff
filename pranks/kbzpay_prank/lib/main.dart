import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbzpay_prank/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Stack(
        children: <Widget>[
          Container(
            height: deviceHeight + 200,
            width: deviceWidth,
            color: Colors.grey[200],
          ),
          Container(
            width: deviceWidth,
            height: deviceHeight / 5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff0053aa),
                      Color(0xff0052a7),
                    ]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "KBZPay",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black26),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: deviceWidth,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Balance (Ks) ",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                ),
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.blue,
                                  size: 18,
                                )
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.blue,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("8,925,675",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          ".00",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      "images/us.png",
                                      scale: 1.7,
                                    ),
                                    Text(" 1 USD = "),
                                    Image.asset(
                                      "images/myanmar.png",
                                      scale: 1.7,
                                    ),
                                    Text(" 1316 MMK "),
                                    Icon(
                                      Icons.play_arrow,
                                      size: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                MaterialButton(
                                  minWidth: 97,
                                  height: 35,
                                  onPressed: () => null,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      side:
                                          BorderSide(color: Color(0xff0052a7))),
                                  child: Text(
                                    "Cash In ",
                                    style: TextStyle(
                                        color: Color(0xff0052a7),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                                MaterialButton(
                                  height: 35,
                                  minWidth: 97,
                                  onPressed: () => null,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      side:
                                          BorderSide(color: Color(0xff0052a7))),
                                  child: Text(
                                    "Cash Out",
                                    style: TextStyle(
                                        color: Color(0xff0052a7),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: deviceWidth,
                  color: Color(0xFFeaf2fb),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset(
                                "images/speaker.png",
                                scale: 1.7,
                              ),
                              Text(
                                " Click here for KBZPay tutorials!",
                                style: TextStyle(
                                    color: Color(0xff0053aa), fontSize: 15),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.close,
                            color: Colors.blue,
                            size: 20,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: deviceWidth / 2 - 20,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "images/scan_and_pay.png",
                              scale: 1.7,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Scan and Pay",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: deviceWidth / 2 - 28,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "images/receive.png",
                              scale: 1.7,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Receive",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: deviceHeight / 2 - 80,
                    width: deviceWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 4))
                        ],
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset("images/kbzpay_loan_center.png",
                                  scale: 1.7),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "  KBZPay Loan Center",
                                style: kMenuText,
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                size: 30,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "images/transfer.png",
                                scale: 1.7,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                " Transfer",
                                style: kMenuText,
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                size: 30,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset("images/nearby.png", scale: 1.7),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "   Nearby",
                                style: kMenuText,
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                size: 30,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "images/bank_account.png",
                                scale: 1.7,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "   Bank Account",
                                style: kMenuText,
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                size: 30,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "images/history.png",
                                scale: 1.7,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "   History",
                                style: kMenuText,
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                size: 30,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Promotion",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500)),
                    Text("View All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
