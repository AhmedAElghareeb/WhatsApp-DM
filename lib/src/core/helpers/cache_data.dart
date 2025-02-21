import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_messaging/src/locator.dart';

abstract class CacheHelper {
  static final SharedPreferences _preferences = locator<SharedPreferences>();

  static Future<bool> setStringData(
      {required String key, required String value}) async =>
      await _preferences.setString(key, value);

  static String? getStringData({required String key}) =>
      _preferences.getString(key);

  static Future<bool> setIntData(
      {required String key, required int value}) async =>
      await _preferences.setInt(key, value);

  static int? getIntData({required String key}) => _preferences.getInt(key);

  static Future<bool> setDoubleData(
      {required String key, required double value}) async =>
      await _preferences.setDouble(key, value);

  static double? getDoubleData({required String key}) =>
      _preferences.getDouble(key);

  static Future<bool> setBoolData(
      {required String key, required bool value}) async =>
      await _preferences.setBool(key, value);

  static bool? getBoolData({required String key}) => _preferences.getBool(key);

  static Future<bool> removeData({required String key}) async =>
      await _preferences.remove(key);

  static Future<bool> clearData() async => await _preferences.clear();
}