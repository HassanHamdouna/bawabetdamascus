import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  static SharedPrefController? _instance;
  late SharedPreferences _prefs;

  SharedPrefController._();

  static SharedPrefController get instance {
    _instance ??= SharedPrefController._();
    return _instance!;
  }

  /// 🔹 تهيئة SharedPreferences مرة واحدة فقط عند بداية التطبيق
  Future<void> initPref() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// 🔹 حفظ أي نوع من القيم
  Future<void> setValue(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw Exception('Unsupported type');
    }
  }

  /// 🔹 قراءة القيم
  T? getValue<T>(String key) {
    return _prefs.get(key) as T?;
  }

  /// 🔹 حذف مفتاح معين
  Future<void> removeValue(String key) async {
    await _prefs.remove(key);
  }

  /// 🔹 حذف جميع البيانات (تسجيل خروج مثلاً)
  Future<void> clear() async {
    await _prefs.clear();
  }

  /// 🔹 دوال جاهزة لحفظ أشياء متكررة
  static const String keyLang = 'lang';
  static const String keyTheme = 'isDark';
  static const String keyUserToken = 'user_token';

  Future<void> saveLanguage(String code) async {
    await setValue(keyLang, code);
  }

  String get language => getValue<String>(keyLang) ?? 'en';

  Future<void> saveTheme(bool isDark) async {
    await setValue(keyTheme, isDark);
  }

  bool get isDark => getValue<bool>(keyTheme) ?? false;

  Future<void> saveUserToken(String token) async {
    await setValue(keyUserToken, token);
  }

  String? get userToken => getValue<String>(keyUserToken);
}
