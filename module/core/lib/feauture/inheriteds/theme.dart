import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeTypeManager {
  ThemeType type = ThemeType.light;

  void setLight() => type = ThemeType.light;
  void setDark() => type = ThemeType.dark;
}

class ThemeManager extends InheritedWidget {
  final ThemeTypeManager themeType;

  const ThemeManager({
    super.key,
    required this.themeType,
    required super.child,
  });

  static ThemeManager? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeManager>();
  }

  static ThemeManager of(BuildContext context) {
    final response = maybeOf(context);
    assert(response != null, ' Have Not exist in Context');
    return response!;
  }

  @override
  bool updateShouldNotify(ThemeManager oldWidget) {
    return oldWidget.themeType != themeType;
  }
}
