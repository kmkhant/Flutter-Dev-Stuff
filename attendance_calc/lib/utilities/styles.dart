import 'package:flutter/material.dart';

final kTitleStyle = TextStyle(color: Colors.white, fontSize: 26.0, height: 1.5);

final kSubtitleStyle =
    TextStyle(color: Colors.white, fontSize: 18.0, height: 1.2);

final kBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
      0.2,
      0.4,
      0.7,
      0.9
    ],
        colors: [
      Color(0xFF5B16D0),
      Color(0xFF45633DB),
      Color(0xFF5036D5),
      Color(0xFF5B16D0)
    ]));
