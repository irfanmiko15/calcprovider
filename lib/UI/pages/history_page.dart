
import 'package:calculatorapp/datasource/prefs/calculation.dart';
import 'package:calculatorapp/provider/data/calculation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [HistoryWidget] shows recent 10 calculations in the UI
class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = ['/', '*', '+', '-', '='];
    return 
        SizedBox(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,

                            children: CalculationPref.instance.calcs
                                .map((e) => Container(
                                  width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.only(
                                          top: 15, right: 10),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              e.userInput,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,fontSize: 17),
                                            ),
                                            Text(
                                              '= ${e.total}',
                                              style: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          )
                      
                    
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  CalculationPref.instance.clearAll();
                  Provider.of<CalculationProvider>(context, listen: false).setShowHistory = false;
                },
                shape: const StadiumBorder(),
                color: Color.fromARGB(255, 51, 137, 54),
                child: const Text(
                  'Clear History',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
      
    );
  }
}