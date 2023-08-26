import 'package:calculatorapp/datasource/prefs/calculation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../datasource/model/calculation_model.dart';

class CalculationProvider with ChangeNotifier {
  String _equation = "0";
  String get equation => _equation;

  String _result = "0";
  String get result => _result;

  bool _isShowHistory = false;
  bool get isShowHistory => _isShowHistory;
  set setShowHistory(value) {
    _isShowHistory = value;
    notifyListeners();
  }

  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _equation = "0";
      _result = "0";
      equationFontSize = 38.0;
      resultFontSize = 48.0;
      notifyListeners();
    } else if (buttonText == "⌫") {
      equationFontSize = 48.0;
      resultFontSize = 38.0;
      _equation = equation.substring(0, equation.length - 1);

      if (equation == "") {
        _equation = "0";
      }
      notifyListeners();
    } else if (buttonText == "=") {
      equationFontSize = 38.0;
      resultFontSize = 48.0;

      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        var temp = '${exp.evaluate(EvaluationType.REAL, cm)}';
        var split = temp.split(".");
        if (split[1] == "0") {
          _result = split[0];
        } else {
          _result = temp;
        }

        CalculationPref.instance.setCalculation(
            Calculations(total: _result, userInput: expression));
        notifyListeners();
      } catch (e) {
        _result = "Error";
        notifyListeners();
      }
    } else {
      equationFontSize = 48.0;
      resultFontSize = 38.0;
      if (equation == "0") {
        _equation = buttonText;
        notifyListeners();
      } else {
        _equation = equation + buttonText;
        notifyListeners();
      }
    }
  }
}
