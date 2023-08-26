import '../datasource/prefs/config.dart';
import '../generated/l10n.dart';
import 'package:flutter/material.dart';

class Lang {
  static const String EN = "English";
  static const String ID = "Bhs. Indonesia";
  static const String en = 'en';
  static const String id_ID = 'id_ID';

  static const Iterable<String> supported = [en, id_ID];

  static const Map<String, String> _langCountries = {
    en: EN,
    id_ID: ID,
  };

  static String validLocale(Locale locale) =>
      locale.countryCode == null || locale.countryCode!.isEmpty
          ? locale.languageCode
          : locale.toString();

  static String fromValidLocaleString(String localeString) =>
      _langCountries[localeString] ?? "";

  static String fromLocaleToString(Locale locale) =>
      _langCountries[validLocale(locale)] ?? "";
}

class Languages {
  Function(Locale newLocale) onLocaleChanged;

  Languages._privateConstructor(this.onLocaleChanged);

  static Languages? instance;

  static Future<Locale?> init({
    required Function(Locale newLocale) onLocaleChanged,
  }) {
    assert(
        onLocaleChanged != null);
    instance ??= Languages._privateConstructor(onLocaleChanged);
    return instance!.loadLocale();
  }

  Future<void> change(Locale locale) async {
    assert(locale != null && onLocaleChanged != null);
    await S.delegate.load(locale);
    await ConfigPref.instance.setLocale(Lang.validLocale(locale));
    onLocaleChanged(locale);
  }

//  Future<void> load() async {
//    ConfigPref configPref = await ConfigPref.instance;
//    List<String> splited = configPref?.locale?.split("_") ?? [];
//    if (splited.length == 1) {
//      await change(Locale(splited[0]));
//    } else if (splited.length == 2) {
//      await change(Locale(splited[0], splited[1]));
//    }
//  }

  Future<Locale?> loadLocale() async {
    var splited = ConfigPref.instance.locale?.split("_") ?? [];
    if (splited.length == 1) {
      return Locale(splited[0]);
    } else if (splited.length == 2) {
      return Locale(splited[0], splited[1]);
    }
    return null;
  }
}
