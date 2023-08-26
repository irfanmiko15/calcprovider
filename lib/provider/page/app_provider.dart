import 'package:flutter/material.dart';
import '../../datasource/prefs/config.dart';
import '../../service/localization_service.dart';
import '../../utils/locator.dart';
import '../../utils/utils.dart';

class AppProvider with ChangeNotifier {
  
  ThemeMode get themeMode =>
      ConfigPref.instance.themeMode;

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await ConfigPref.instance.setThemeMode(themeMode);
    notifyListeners();
  }
  Locale? get locale => locator<LocalizationService>().current;

  Future<void> changeLocale(Locale newLocale) async {
    await locator<LocalizationService>().change(newLocale);
    notifyListeners();
  }
}
