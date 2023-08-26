import 'package:calculatorapp/UI/pages/calculator_page.dart';
import 'package:flutter/material.dart';

import '../App.dart';
import '../UI/pages/splash_page.dart';
import '../App.dart';
import './../utils/extensions.dart';
final Map<String, PageBuilder> routers = {
  Routes.init:  (_) => SplashPage(),
  Routes.calculator:(_)=>CalculatorPage(),
  
  
};

class Routes {
 

  const Routes();

  //Route - Main
  static const String init = "/";
  static const String splash = "/splash";
  static const String login="/login";
  static const String calculator="/calculator";

  //Route - Other
  static const String search = "/search";
  static const String photo = "/photo";
  static const String contactUs = "/contact_us";
  static const String markdown = "/markdown";
  static const String about = "/about";
  static const String webView = "/webview";
  static const String notFound = "/not_found";
  static const String underDevelopment = "/under_development";
 
  
}
class Args {

  //route args
  static const String user = "user";
  static const String phone = "phone";
  static const String type = "type";
  static const String imageUrl = "image_url";
  static const String markdownData = "markdown_data";
  static const String searchData = "search_data";
  static const String url = "url";
  static const String title = "title";
 


  const Args._();
}