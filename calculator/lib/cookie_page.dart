import 'package:flutter/material.dart';
import 'package:fluttercalculator/circle_progress.dart';
import 'package:fluttercalculator/cookie_detail.dart';
import 'package:fluttercalculator/subjects.dart';

class ChartState extends StatefulWidget {
  ChartState({Key key}) : super(key: key);
  
  @override 
  SubjectsPage createState() => SubjectsPage();
}

class SubjectsPage extends State<ChartState> with SingleTickerProviderStateMixin {

  List<DynamicSubject> subjects = DynamicSubject.listSubjects;
  List<Widget> cards = [];

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: 
        NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [

            ];
          },
          body: ListView(
            children: <Widget>[
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Cookie Mint', '\$3.99', 'assets/cookieclassic.jpg', false, false, context),
                  _buildCard('Cookie Choko', '\$4.99', 'assets/cookiechoco.jpg', true, true, context),
                  _buildCard('Cookie Cream', '\$2.99', 'assets/cookiecream.jpg', false, false, context),
                  _buildCard('Cookie Van', '\$2.99', 'assets/cookievan.jpg', false, false, context),
                  _buildCard('Cookie Mint', '\$2.99', 'assets/cookiemint.jpg', false, false, context),
                  SizedBox(height: 20),
                ],
              )),
            SizedBox(height: 15.0),
          ],
      )
    ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added, bool isFavorite, context) {
    
    AnimationController progressController;
    Animation<double> animation;

    @override
    void initState() {
      super.initState();


      progressController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
      animation = Tween<double>(begin: 0, end: 0).animate(progressController)..addListener(() {
        setState(() {

        });
      });
    }
    
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CookieDetail(
              assetPath: imgPath,
              cookiePrice: price,
              cookieName: name,
            ))
          );
        },

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 3.0
              )
            ],
            color: Colors.white),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isFavorite
                    ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                    : Icon(Icons.favorite_border,
                        color: Color(0xFFEF7532))
              ])),
          Hero(
              tag: imgPath,
              child: Container(
                  height: 75.0,
                  width: 75.0,

                  child: CustomPaint(
                    foregroundPainter: CircleProgess(animation.value),
                    child: Container(
                      height: 65,
                      width: 65,
                      child: GestureDetector(
                        onTap: () {
                          if(animation.value <= 100) {
                            progressController.forward();
                          }
                        },
                      ),
                    ), // null value is called
                  ),

                  //decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage(imgPath),
                      //     fit: BoxFit.contain))
                      //)
                      )),
          SizedBox(height: 7.0),
          Text(price,
              style: TextStyle(
                  color: Color(0xFFCC8053),
                  fontFamily: 'Varela',
                  fontSize: 14.0)),
          Text(name,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 14.0)),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
          Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      Icon(Icons.shopping_basket,
                          color: Color(0xFFD17E50), size: 12.0),
                      Text('Add to cart',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              color: Color(0xFFD17E50),
                              fontSize: 12.0))
                    ],
                    if (added) ... [
                      Icon(Icons.remove_circle_outline,
                          color: Color(0xFFD17E50), size: 12.0),
                      Text('3',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              color: Color(0xFFD17E50),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      Icon(Icons.add_circle_outline,
                          color: Color(0xFFD17E50), size: 12.0),
                    ]
                  ]))
    ]))));
  }
}