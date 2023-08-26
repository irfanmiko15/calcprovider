
import '../datasource/prefs/config.dart';
import '../generated/l10n.dart';
import 'package:flutter/material.dart';

class LangOptions {
  const LangOptions._();

  //Name
  static const String EN = 'English';
  static const String ID = 'Bhs. Indonesia';

  //Country Code
  static const String en = 'en';
  static const String id_ID = 'id_ID';

  static const Map<String, String> _langCountries = {
    en: EN,
    id_ID: ID,
  };

  static String? toLocaleString(Locale locale) =>
      locale.countryCode == null || locale.countryCode!.isEmpty
          ? locale.languageCode
          : locale.toString();

  static String localeStringToName(String localeString) =>
      _langCountries[localeString] ?? '';

  static String localeToName(Locale locale) =>
      _langCountries[toLocaleString(locale)] ?? '';
}

typedef LocaleCallback = Function(Locale newLocale);

class LocalizationService {
  LocaleCallback? _onLocaleChanged;

  Locale? _current;

  Locale? get current => _current;

  LocalizationService() {
    loadLocale();
  }

  void setListener(LocaleCallback? onLocaleChanged) {
    _onLocaleChanged = onLocaleChanged;
  }

  Future<void> change(Locale locale) async {
    assert(locale != null);
    await S.delegate.load(locale);
    await ConfigPref.instance.setLocale(LangOptions.toLocaleString(locale)!);
    _current = locale;
    if (_onLocaleChanged != null) _onLocaleChanged!(locale);
  }

  Locale? loadLocale() {
    var split = ConfigPref.instance.locale?.split('_') ?? [];
    if (split.length == 1) {
      _current = Locale(split[0]);
    } else if (split.length == 2) {
      _current = Locale(split[0], split[1]);
    }
    return _current;
  }
}
