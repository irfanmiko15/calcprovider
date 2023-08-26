import 'package:calculatorapp/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'prefs.dart';

class ConfigPref extends BasePref {
  ConfigPref._() : super('config');
  static ConfigPref instance = ConfigPref._();

  //KEY
  static const String LOCALE = "locale";

  //KEY
  static const String USE_DEV_MODE = "use_dev_mode";

  static const String THEME_MODE = 'THEME_MODE';

  //ACCESSOR
  String? get locale => getString(LOCALE);

  Future<void>? setLocale(String locale) => setString(LOCALE, locale);


  ThemeMode get themeMode =>
      th[getString(THEME_MODE)] ?? ThemeMode.light; //Utils.getSystemTheme();

  Future<bool?> setThemeMode(ThemeMode themeMode) =>
      setString(THEME_MODE, th.getKey(themeMode));

  Future<bool?> deleteThemeMode() => remove(THEME_MODE);
}

const Map<String, ThemeMode> th = {
  'system': ThemeMode.system,
  'light': ThemeMode.light,
  'dark': ThemeMode.dark,
};