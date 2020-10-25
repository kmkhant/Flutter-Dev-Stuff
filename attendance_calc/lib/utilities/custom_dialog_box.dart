import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      content: Container(
        height: 300,
        width: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total"),
                SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                    ),
                    Text("23"),
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Atten"),
                Row(
                  children: [
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                    ),
                    Text("7"),
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Absen"),
                Row(
                  children: [
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                    ),
                    Text("2"),
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      shape: CircleBorder(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
