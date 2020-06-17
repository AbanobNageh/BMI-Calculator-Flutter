import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  BottomButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColor,
      height: kBottomContainerHeight,
      width: double.infinity,
      child: FlatButton(
        child: Text(
          buttonText,
          style: kButtonTextStyle,
        ),
        onPressed: onPressed,
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
  }
}
