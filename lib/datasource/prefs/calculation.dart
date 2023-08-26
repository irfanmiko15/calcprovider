import 'dart:async';
import 'dart:convert';

import 'package:calculatorapp/datasource/model/calculation_model.dart';

import 'prefs.dart';

class CalculationPref extends BasePref {
  CalculationPref._() : super("calculation");
  static CalculationPref instance = CalculationPref._();

  //KEY
  static const String LIST_CALCULATION = "list_calculation";

  Future<void> setCalculation(Calculations calc) async{
      final calculations = calcs;
      if (calculations.length == 10) {
      calculations.removeAt(0);
    }
      calculations.add(calc);
      await setString(LIST_CALCULATION, Calculations.encode(calculations));
      calcs;
  }

  List<Calculations> get calcs {
    List<Calculations> temp=[];
    var userRaw = getString(LIST_CALCULATION);
    if (userRaw != null) {
      temp.addAll(Calculations.decode(userRaw));
    }
    
    return temp;
  }


  
  Future<void> clearList() => remove(LIST_CALCULATION);
}
