import 'package:flutter/cupertino.dart';
import 'package:theme/notifier/index.dart';

extension InheritedExtension on BuildContext {
  ThemeNotifier get themeNotifier => ThemeNotifier.of(this);

  bool get isThemeLight {
    if (themeNotifier.isNullable) return true;
    return themeNotifier.notifier!.isLight;
  }

  bool get isThemeDark {
    if (themeNotifier.isNullable) return false;
    return themeNotifier.notifier!.isDark;
  }
}
