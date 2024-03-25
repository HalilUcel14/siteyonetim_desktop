import 'package:flutter/material.dart';

enum LangType { en, tr }

class LangManager extends ChangeNotifier {
  LangType type = LangType.tr;

  void get setTR {
    type = LangType.tr;
    notifyListeners();
  }

  void get setEN {
    type = LangType.en;
    notifyListeners();
  }

  bool get isTr => type == LangType.tr;
  bool get isEn => type == LangType.en;
}

class LanguageManager extends InheritedWidget {
  final LangManager lang;

  const LanguageManager({
    super.key,
    required this.lang,
    required super.child,
  });

  static LanguageManager? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LanguageManager>();
  }

  static LanguageManager of(BuildContext context) {
    final response = maybeOf(context);
    assert(response != null, ' Have Not exist in Context');
    return response!;
  }

  @override
  bool updateShouldNotify(LanguageManager oldWidget) {
    print(oldWidget.lang.type != lang.type);
    return oldWidget.lang.type != lang.type;
  }
}
