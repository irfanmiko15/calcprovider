import 'dart:async';
import 'dart:io';

import 'package:calculatorapp/provider/provider.dart';
import 'package:calculatorapp/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'app.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
//  HttpOverrides.global = GlobalHttpOverrides();

  ErrorWidget.builder = (details) => Container();

 

  assert(() {
    ErrorWidget.builder =
        (details) => ErrorWidget(details.exception);
    // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    return true;
  }());
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  setupLocator();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runZoned(
        () => runApp(MultiProvider(
        providers: providers,
        child: App())),
    // onError: FirebaseCrashlytics.instance.recordError,
  );
}
