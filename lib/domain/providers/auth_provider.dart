import 'package:flutter/material.dart';
// import '../../data/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  static const String _userKey = 'currentUser';

/*  UserModel? _currentUser;
  bool get isLoggedIn => _currentUser != null;
  UserModel? get currentUser => _currentUser;*/

/*  AuthProvider() {
    _loadUser();
  }*/

/*
  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString(_userKey);
    if (userData != null) {
      _currentUser = UserModel.fromJsonString(userData);
    }
    notifyListeners();
  }
*/

/*
  Future<void> login(UserModel user) async {
    _currentUser = user;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, user.toJsonString());
    notifyListeners();
  }
*/

/*  Future<void> logout() async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    notifyListeners();
  }*/
}
