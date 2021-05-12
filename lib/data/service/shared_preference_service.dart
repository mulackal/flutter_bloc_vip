
/*
 * Copyright (c) 2021, Vipin.
 */
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesService {
  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  SharedPreferencesService._internal();

  static Future<SharedPreferencesService> get instance async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }



  Future<void> setStringSesssion(String key, String value) async =>
      await _preferences.setString(key, value);

  String getStringSession(String key) => _preferences.getString(key);

  Future<void> setBoolSesssion(String key, [bool value = false]) async =>
      await _preferences.setBool(key, value);

  bool getBoolSession(String key) => _preferences.getBool(key);


  Future<void> setIntSession(String key, int value) async =>
      await _preferences.setInt(key, value);

  int getIntSession(String key) => _preferences.getInt(key);

  Future<void> setDoubleSession(String key, double value) async =>
      await _preferences.setDouble(key, value);

  double getDoubleSession(String key) => _preferences.getDouble(key);


  /** clear all session variables**/
  Future<void> clearSession() async => await _preferences.clear();
}
