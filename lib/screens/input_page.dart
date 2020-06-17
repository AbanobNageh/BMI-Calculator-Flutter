import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/background_card.dart';
import '../components/gender_card.dart';
import 'result_page.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/number_selection_card.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int heightValue = 170;
  int weight = 75;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BackgroundCard(
                        color: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: GenderCardContent(
                          displayedIconData: FontAwesomeIcons.mars,
                          cardTitle: 'MALE',
                        ),
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: BackgroundCard(
                        color: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: GenderCardContent(
                          displayedIconData: FontAwesomeIcons.venus,
                          cardTitle: 'FEMALE',
                        ),
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BackgroundCard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            heightValue.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'Cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: kSliderThumbColor,
                          overlayColor: kSliderThumbOverlayColor,
                          activeTrackColor: kSliderActiveColor,
                          inactiveTrackColor: kSliderInactiveColor,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          min: 120,
                          max: 220,
                          value: heightValue.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              heightValue = value.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BackgroundCard(
                        color: kActiveCardColor,
                        cardChild: NumberSelectionCard(
                          label: 'WEIGHT',
                          defaultNumber: weight,
                          onNumberIncreased: () {
                            setState(() {
                              weight++;
                            });
                          },
                          onNumberDecreased: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: BackgroundCard(
                        color: kActiveCardColor,
                        cardChild: NumberSelectionCard(
                          label: 'AGE',
                          defaultNumber: age,
                          onNumberIncreased: () {
                            setState(() {
                              age++;
                            });
                          },
                          onNumberDecreased: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                buttonText: 'CALCULATE YOUR BMI',
                onPressed: () {
                  if (selectedGender != Gender.male && selectedGender != Gender.female) {
                    Alert(context: context, title: "Choose a gender!", desc: "You must choose a gender").show();
                    return;
                  }

                  CalculatorBrain calculatorBrain = CalculatorBrain(weight: weight, height: heightValue);
                  calculatorBrain.calculateBMI();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(
                          calculatorBrain: calculatorBrain,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
