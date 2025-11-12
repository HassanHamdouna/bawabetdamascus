import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  static const String _themeKey = 'isDarkMode';
  static const String _languageKey = 'languageCode';

  bool _isDarkMode = false;
  String _languageCode = 'en';

  bool get isDarkMode => _isDarkMode;
  String get languageCode => _languageCode;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(_themeKey) ?? false;
    _languageCode = prefs.getString(_languageKey) ?? 'en';
    notifyListeners();
  }

  Future<void> toggleTheme(bool isDark) async {
    _isDarkMode = isDark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, _isDarkMode);
    notifyListeners();
  }

  Future<void> changeLanguage(String code) async {
    _languageCode = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, _languageCode);
    notifyListeners();
  }
}
