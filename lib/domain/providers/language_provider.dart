import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('en');
  Locale get currentLocale => _currentLocale;

  LanguageProvider() {
    _loadLanguage();
  }

  void changeLanguage(String code) async {
    _currentLocale = Locale(code);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', code);
  }

  void _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('lang') ?? 'en';
    _currentLocale = Locale(code);
    notifyListeners();
  }
}
