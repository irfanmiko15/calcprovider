import 'package:calculatorapp/provider/data/calculation_provider.dart';
import 'package:calculatorapp/provider/page/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [

//  ChangeNotifierProvider.value(value: ScheduleProvider()),
////Jangan Lupa Tambahin di doLogout di homepage .clear()
ChangeNotifierProvider.value(value: AppProvider()),
ChangeNotifierProvider.value(value: CalculationProvider()),
];