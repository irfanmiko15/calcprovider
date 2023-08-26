import 'package:calculatorapp/UI/pages/history_page.dart';
import 'package:calculatorapp/datasource/prefs/calculation.dart';
import 'package:calculatorapp/provider/data/calculation_provider.dart';
import 'package:calculatorapp/provider/page/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  _getColor(String text, AppProvider p) {
    if (text == "÷" ||
        text == "×" ||
        text == "+" ||
        text == "-" ||
        text == "(" ||
        text == ")") {
      return Color.fromARGB(255, 51, 137, 54);
    }
    if (text == "=") {
      return Colors.white;
    }
    if (text == "C") {
      return Colors.red;
    }
    return p.themeMode == ThemeMode.dark
        ? Color.fromARGB(255, 51, 137, 54)
        : Colors.black;
  }

  Widget buildButton(
      String buttonText, CalculationProvider calculationProvider) {
    return Consumer<AppProvider>(builder: (context, p, child) {
      return Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
            onPressed: () => calculationProvider.buttonPressed(buttonText),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonText == "="
                  ? Color.fromARGB(255, 51, 137, 54)
                  : p.themeMode == ThemeMode.dark
                      ? Colors.grey.shade900
                      : Color.fromARGB(255, 230, 230, 230),
              shape: const CircleBorder(),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  color: _getColor(buttonText, p)),
            )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculationProvider>(builder: (context, p, child) {
      return Scaffold(
          body: Column(children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            p.equation,
            style: TextStyle(fontSize: p.equationFontSize),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Text(
            p.result,
            style: TextStyle(fontSize: p.resultFontSize),
          ),
        ),
        Divider(),
        Consumer<AppProvider>(builder: (context, provider, child) {
          return Row(
            children: [
              IconButton(
                  onPressed: () {
                    p.setShowHistory = !p.isShowHistory;
                  },
                  icon: p.isShowHistory
                      ? Icon(
                          Icons.keyboard,
                          // color: Colors.white,
                        )
                      : Icon(
                          Icons.access_time,
                          // color: Colors.white,
                        )),
              IconButton(
                  onPressed: () {
                    if (provider.themeMode == ThemeMode.dark) {
                      provider.setThemeMode(ThemeMode.light);
                    } else {
                      provider.setThemeMode(ThemeMode.dark);
                    }
                  },
                  icon: Icon(
                    provider.themeMode != ThemeMode.dark
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    color: Colors.green,
                  )),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          p.buttonPressed("⌫");
                        },
                        child: Text(
                          "⌫",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 137, 54),
                              fontSize: 30),
                        ))),
              )
            ],
          );
        }),
        Divider(),
        Container(
          height: MediaQuery.of(context).size.height * 0.63,
          width: MediaQuery.of(context).size.width * 0.92,
          child: Stack(
            children: [
              p.isShowHistory
                  ? HistoryWidget()
                  : GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      children: [
                        buildButton("C", p),
                        buildButton("(", p),
                        buildButton(")", p),
                        buildButton("÷", p),
                        buildButton("7", p),
                        buildButton("8", p),
                        buildButton("9", p),
                        buildButton("×", p),
                        buildButton("4", p),
                        buildButton("5", p),
                        buildButton("6", p),
                        buildButton("-", p),
                        buildButton("1", p),
                        buildButton("2", p),
                        buildButton("3", p),
                        buildButton("+", p),
                        buildButton(".", p),
                        buildButton("0", p),
                        buildButton("00", p),
                        buildButton("=", p),
                      ],
                    ),
            ],
          ),
        )
      ]));
    });
  }
}
