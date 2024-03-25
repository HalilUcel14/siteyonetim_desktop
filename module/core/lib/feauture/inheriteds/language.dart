import 'package:flutter/material.dart';

enum LangType { en, tr }

class LangManager extends ChangeNotifier {
  LangType _type = LangType.tr;

  LangType get type => _type;

  void setTR() {
    _type = LangType.tr;
    notifyListeners();
  }

  void setEN() {
    _type = LangType.en;
    notifyListeners();
  }

  void change() {
    _type = _type == LangType.tr ? LangType.en : LangType.tr;
    print(_type);
    notifyListeners();
  }

  bool get isTr => _type == LangType.tr;
  bool get isEn => _type == LangType.en;
}

class LanguageNotifier extends InheritedNotifier<LangManager> {
  const LanguageNotifier({
    super.key,
    required LangManager notifier,
    required super.child,
  }) : super(notifier: notifier);

  static LanguageNotifier? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LanguageNotifier>();
  }

  static LanguageNotifier of(BuildContext context) {
    final response = maybeOf(context);
    assert(response != null, 'LanguageNotifier not found in context');
    return response!;
  }

  @override
  bool updateShouldNotify(InheritedNotifier<LangManager> oldWidget) {
    return oldWidget.notifier!.type != notifier!.type;
  }
}

class LanguageManager extends InheritedWidget {
  final LangManager langManager;
  final VoidCallback change;

  const LanguageManager({
    super.key,
    required this.langManager,
    required this.change,
    required super.child,
  });

  static LanguageManager? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LanguageManager>();
  }

  static LanguageManager of(BuildContext context) {
    final response = maybeOf(context);
    assert(response != null, 'LanguageManager not found in context');
    return response!;
  }

  @override
  bool updateShouldNotify(LanguageManager oldWidget) {
    return oldWidget.langManager.type != langManager.type;
  }
}
