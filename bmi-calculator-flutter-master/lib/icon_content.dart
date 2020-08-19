import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderCardInfo extends StatelessWidget {
  GenderCardInfo({@required this.icon, this.description});

  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          description,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
