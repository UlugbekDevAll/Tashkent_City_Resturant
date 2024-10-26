

 import 'package:shared_preferences/shared_preferences.dart';


class StorageRequest{

   Future<bool> save({required String key, required String value}) async {
     final prefs = await SharedPreferences.getInstance();
     return await prefs.setString(key, value);
   }

   Future<String?> get({required String key}) async {
     final prefs = await SharedPreferences.getInstance();
     return prefs.getString(key);
   }
 }