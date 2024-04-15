import 'package:flutter/material.dart';
import 'package:theme/notifier/index.dart';

class ThemeNotifier extends InheritedNotifier<ThemeChange> {
  const ThemeNotifier({
    super.key,
    required ThemeChange notifier,
    required super.child,
  }) : super(notifier: notifier);

  bool get isNullable => notifier == null;

  static ThemeNotifier? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeNotifier>();
  }

  static ThemeNotifier of(BuildContext context) {
    final response = maybeOf(context);
    assert(response != null, 'ThemeNotifier not found in context');
    return response!;
  }

  @override
  bool updateShouldNotify(InheritedNotifier<ThemeChange> oldWidget) {
    return oldWidget.notifier!.type != notifier!.type;
  }
}
