import 'package:flutter/material.dart';
import '../components/background_card.dart';
import '../components/result_card.dart';
import 'package:bmi_calculator/constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  final CalculatorBrain calculatorBrain;

  ResultPage({this.calculatorBrain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Your Result:',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: BackgroundCard(
                color: kActiveCardColor,
                cardChild: ResultCard(calculatorBrain: calculatorBrain,),
              ),
            ),
            BottomButton(
              buttonText: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
