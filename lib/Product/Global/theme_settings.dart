import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isLightThene = false;
  void changeTheme() {
    _isLightThene = !_isLightThene;
    notifyListeners();
  }

  ThemeData get currentTheme =>
      _isLightThene ? ThemeData.light() : ThemeData.dark();
}
