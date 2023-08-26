import 'dart:ui';
import 'package:flutter/material.dart';

class Configs{
  static const String appName = 'Calculator app'; //.arb juga diganti
  static const String companyName = 'PT EMobile'; //.arb juga diganti

  static const String dbName = 'Emobile';
  static const String dbPass = 'mypass123';
  static const int dbVersion = 1;
  static const String whatsAppNumber = "+6285399927324";
  static const String telephoneNumber = "+6285399927324";
  static const String emailAddress = "oke@oke.com";
  static const String emailBody = "";
  static const String companyAddress = "Jl. ABC, Ancol, Jakarta";
  //key
  static const String keyGCP = ""; //API Key

  //Firebase
  static const String generalTopic = "general";
  static const String notificationInAppDialog = "inappdialog";
  static const String notificationForeground = "foreground";
}
class Urls {
  const Urls();

  //Other
  static const String privacy = "https://policies.com";
  static const String terms = "https://policies.terms.com";
  static const String update =
      '';
}

class Fonts {
  const Fonts();

  static const String gilroy = "Gilroy";
}

class AppColors {
  AppColors._();

  static const Color primary = Color(0xff002060);
    static const Color accent = Color.fromARGB(255, 9, 57, 152);
  static const Color primaryLight = Color(0xff597393);
  static final Color orage = Color(0xffFF7200);
  static const Color tosca = Color(0xff00D9D5);
  static const Color hintColor = Color(0xff5F5F5F);

  
}

class AppTheme{
  AppTheme._();
  static var darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    dividerColor: Colors.white30,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    fontFamily: Fonts.gilroy,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      secondary: Colors.white,
      brightness: Brightness.dark,
    ),
  );

  /// Light Theme
   static var lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    fontFamily: Fonts.gilroy,
    iconTheme: const IconThemeData(color: Colors.black),
    backgroundColor: const Color(0xFFE5E5E5),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
    dividerColor: Colors.white54,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      secondary: Colors.black,
      brightness: Brightness.light,
    ),
  );
}