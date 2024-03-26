import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeModeType extends ChangeNotifier {
  ThemeType _type = ThemeType.light;

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

class ThemeNotifier extends InheritedNotifier<ThemeModeType> {
  const ThemeNotifier({
    super.key,
    required ThemeModeType notifier,
    required super.child,
  }) : super(notifier: notifier);

  static ThemeNotifier? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeNotifier>();
  }

  static ThemeNotifier of(BuildContext context) {
    final response = maybeOf(context);
    assert(response != null, 'ThemeNotifier not found in context');
    return response!;
  }

  @override
  bool updateShouldNotify(InheritedNotifier<ThemeModeType> oldWidget) {
    return oldWidget.notifier!.type != notifier!.type;
  }
}
