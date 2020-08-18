import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgess extends CustomPainter {
  double currentProgress;

  CircleProgess(this.currentProgress);

  @override 
  void paint(Canvas canvas, Size size) {
    // this is base Circle
    Paint outerCircle = Paint()
    ..strokeWidth = 10
    ..color = Colors.green
    ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
    ..strokeWidth = 10
    ..color = Colors.green 
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width, size.height/2) - 10;

    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (currentProgress/100);

    canvas.drawArc(Rect.fromCircle(center: center), -pi/2, angle, false, completeArc);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}