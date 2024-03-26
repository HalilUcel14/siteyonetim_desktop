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
