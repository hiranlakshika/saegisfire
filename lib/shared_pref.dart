import 'package:shared_preferences/shared_preferences.dart';

enum DataTypeEnum { Integer, String, Double, Boolean }

class SharedPreferencesHelper {
  static Future<void> saveValue({required String key, required var value, required DataTypeEnum dataType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (dataType) {
      case DataTypeEnum.Integer:
        await prefs.setInt(key, value);
        break;
      case DataTypeEnum.String:
        await prefs.setString(key, value);
        break;
      case DataTypeEnum.Double:
        await prefs.setDouble(key, value);
        break;
      case DataTypeEnum.Boolean:
        await prefs.setBool(key, value);
        break;
    }
  }

  static Future<dynamic> getValue({required String key, required DataTypeEnum dataType}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (dataType) {
      case DataTypeEnum.Integer:
        return prefs.getInt(key);
      case DataTypeEnum.String:
        return prefs.getString(key);
      case DataTypeEnum.Double:
        return prefs.getDouble(key);
      case DataTypeEnum.Boolean:
        return prefs.getBool(key);
    }
  }

  static Future<void> deleteValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
