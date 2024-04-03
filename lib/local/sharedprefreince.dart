import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  
  static Future<void> settoken(String value) async {
    await sharedPreferences!.setString('token', value);
  }

  static String? gettoken() {
    return sharedPreferences!.getString('token');
  }
  
  static removetoken() {
    return sharedPreferences!.remove('token');
  }
}
