import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';

class ResultCard extends StatelessWidget {
  final CalculatorBrain calculatorBrain;

  ResultCard({this.calculatorBrain});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          calculatorBrain.getResult(),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.green,
          ),
        ),
        Text(
          calculatorBrain.getBMI(),
          style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w800,
              color: Colors.white,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            calculatorBrain.getResultMessage(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
