import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    }
    else if (_bmi >= 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }

  String getResultMessage() {
    if (_bmi >= 25) {
      return 'You are overweight, you need to exercise more!!';
    }
    else if (_bmi >= 18.5) {
      return 'You have a normal body weight, good job.';
    }
    else {
      return 'You are underweightm it is time to eat!';
    }
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }
}