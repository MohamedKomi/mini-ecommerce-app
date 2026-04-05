import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const _keyUsers = "users";
  static const _keyToken = "token";

  // حفظ مستخدم جديد
  static Future<void> saveUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList(_keyUsers) ?? [];
    users.add("$username:$password");
    await prefs.setStringList(_keyUsers, users);
  }

  // التحقق من مستخدم موجود
  static Future<bool> checkUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList(_keyUsers) ?? [];
    return users.contains("$username:$password");
  }

  // حفظ "token" مؤقت بعد login
  static Future<void> saveToken(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, username); // نخزن username كـ token
    print(prefs.getString(_keyToken));
  }

  // جلب token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }
}
