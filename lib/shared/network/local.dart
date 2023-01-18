import 'package:shared_preferences/shared_preferences.dart';

class CashHelper
{
  static late SharedPreferences sharedPreferences;

  static  init ()async {
    sharedPreferences=await SharedPreferences.getInstance();
  }

  static Future<bool>  putDataBool(String? key, {bool value = false})async {
        return await sharedPreferences.setBool(key!, value);
      }

  static Future<bool>  putDataString(String? key, {String value ='system'})async {
    return await sharedPreferences.setString(key!, value);
  }


  static Future<dynamic> getData(String key)async{
      return  sharedPreferences.get(key);
  }
}