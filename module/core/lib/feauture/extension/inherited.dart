import 'package:core/core.dart';
import 'package:flutter/material.dart';

extension InheritedExtension on BuildContext {
  ThemeModeType? get themeModeType => ThemeNotifier.of(this).notifier;

  bool get isThemeLight {
    if (themeModeType == null) return true;
    return themeModeType!.isLight;
  }

  bool get isThemeDark {
    if (themeModeType == null) return false;
    return themeModeType!.isDark;
  }
}
