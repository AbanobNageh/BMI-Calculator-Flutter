import 'package:flutter/material.dart';
import '../constants.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumberSelectionCard extends StatelessWidget {
  final String label;
  final int defaultNumber;
  final Function onNumberIncreased;
  final Function onNumberDecreased;

  NumberSelectionCard({this.label, this.defaultNumber, this.onNumberIncreased, this.onNumberDecreased});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          defaultNumber.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              iconData: FontAwesomeIcons.minus,
              onPressed: onNumberDecreased,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              iconData: FontAwesomeIcons.plus,
              onPressed: onNumberIncreased,
            ),
          ],
        ),
      ],
    );
  }
}
