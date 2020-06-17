import 'package:flutter/material.dart';
import '../constants.dart';

class GenderCardContent extends StatelessWidget {
  final IconData displayedIconData;
  final String cardTitle;

  GenderCardContent({this.displayedIconData, this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          displayedIconData,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardTitle,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
