import 'package:core/core.dart';

class AppNotifier {
  static AppNotifier? _of;
  static AppNotifier get of => _of ??= AppNotifier._init();
  AppNotifier._init();
  //
  // LanguageModel is TR or EN
  final BoolNotifier _language = BoolNotifier(false);
  BoolNotifier get language => _language;
  //
  // ThemeModel is Light or Dark
  final BoolNotifier _theme = BoolNotifier(false);
  BoolNotifier get theme => _theme;
}
