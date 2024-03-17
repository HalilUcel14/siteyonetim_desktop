class FormSettings {
  static FormSettings? _of;
  static FormSettings get of => _of ??= FormSettings._init();
  FormSettings._init();

  final double formFieldSpacing = 20.0;
  final int userLength = 3;
}
