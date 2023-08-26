import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class SharedPrefs {
  const SharedPrefs._(this.prefs);

  static SharedPrefs? instance;

  final SharedPreferences prefs;

  static Future<void> init() async {
    instance ??= SharedPrefs._(await SharedPreferences.getInstance());
  }
}

class BasePref {
  final String group;

  BasePref(this.group);

//  <editor-fold desc="Preference Helper" defaultstate="collapsed">
  static const String _SEPARATOR = "://";

  static SharedPreferences? get _prefs => SharedPrefs.instance?.prefs;

  bool? contain(String key) => _prefs?.containsKey(group + _SEPARATOR + key);

  @protected
  Future<bool?> setString(String key, String value) async =>
      _prefs?.setString(group + _SEPARATOR + key, value);

  @protected
  String? getString(String key) => _prefs?.getString(group + _SEPARATOR + key);

  @protected
  Future<bool?> setInt(String key, int value) async =>
      _prefs?.setInt(group + _SEPARATOR + key, value);

  @protected
  int? getInt(String key) => _prefs?.getInt(group + _SEPARATOR + key);

  @protected
  Future<bool?> setBool(String key, bool value) async =>
      _prefs?.setBool(group + _SEPARATOR + key, value);

  @protected
  bool? getBool(String key) => _prefs?.getBool(group + _SEPARATOR + key);

  @protected
  Future<bool?> setDouble(String key, double value) async =>
      _prefs?.setDouble(group + _SEPARATOR + key, value);

  @protected
  double? getDouble(String key) => _prefs?.getDouble(group + _SEPARATOR + key);

  @protected
  Future<bool?> setStringList(String key, List<String> value) async =>
      _prefs?.setStringList(group + _SEPARATOR + key, value);

  @protected
  List<String>? getStringList(String key) =>
      _prefs?.getStringList(group + _SEPARATOR + key);

  @protected
  Future<bool?> remove(String key) async =>
      _prefs?.remove(group + _SEPARATOR + key);

  Future<bool>?clearAll() => _prefs?.clear();

  //Direct Access

  Future<bool> containD(String key) async =>
      (await SharedPreferences.getInstance())
          .containsKey(group + _SEPARATOR + key);

  Future<bool> setStringD(String key, String value) async =>
      (await SharedPreferences.getInstance())
          .setString(group + _SEPARATOR + key, value);

  Future<String?> getStringD(String key) async =>
      (await SharedPreferences.getInstance())
          .getString(group + _SEPARATOR + key);

  Future<bool> setIntD(String key, int value) async =>
      (await SharedPreferences.getInstance())
          .setInt(group + _SEPARATOR + key, value);

  Future<int?> getIntD(String key) async =>
      (await SharedPreferences.getInstance()).getInt(group + _SEPARATOR + key);

  @protected
  Future<bool> setBoolD(String key, bool value) async =>
      (await SharedPreferences.getInstance())
          .setBool(group + _SEPARATOR + key, value);

  @protected
  Future<bool?> getBoolD(String key) async =>
      (await SharedPreferences.getInstance()).getBool(group + _SEPARATOR + key);

  @protected
  Future<bool> setDoubleD(String key, double value) async =>
      (await SharedPreferences.getInstance())
          .setDouble(group + _SEPARATOR + key, value);

  @protected
  Future<double?> getDoubleD(String key) async =>
      (await SharedPreferences.getInstance())
          .getDouble(group + _SEPARATOR + key);

  @protected
  Future<bool> setStringListD(String key, List<String> value) async =>
      (await SharedPreferences.getInstance())
          .setStringList(group + _SEPARATOR + key, value);

  @protected
  Future<List<String>?> getStringListD(String key) async =>
      (await SharedPreferences.getInstance())
          .getStringList(group + _SEPARATOR + key);

  @protected
  Future<bool> removeD(String key) async =>
      (await SharedPreferences.getInstance()).remove(group + _SEPARATOR + key);

  Future<bool> clearAllD() async =>
      (await SharedPreferences.getInstance()).clear();

//</editor-fold>
}
