import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeChange extends ChangeNotifier {
  ThemeType _type = ThemeType.dark;

  ThemeType get type => _type;

  void setLight() {
    _type = ThemeType.light;
    notifyListeners();
  }

  void setDark() {
    _type = ThemeType.dark;
    notifyListeners();
  }

  void change() {
    _type = isLight ? ThemeType.dark : ThemeType.light;
    notifyListeners();
  }

  bool get isLight => _type == ThemeType.light;
  bool get isDark => _type == ThemeType.dark;
}
