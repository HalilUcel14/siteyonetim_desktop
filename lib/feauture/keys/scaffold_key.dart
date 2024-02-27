import 'package:flutter/material.dart';

final class ScaffoldKeys {
  static ScaffoldKeys? _of;
  static ScaffoldKeys get of => _of ??= ScaffoldKeys._();
  ScaffoldKeys._();

  GlobalKey<ScaffoldState> loginKey = GlobalKey<ScaffoldState>(
    debugLabel: 'Login Scaffolds',
  );

  GlobalKey<ScaffoldState> registerKey = GlobalKey<ScaffoldState>(
    debugLabel: 'Register Scaffolds',
  );

  GlobalKey<ScaffoldState> splashKey = GlobalKey<ScaffoldState>(
    debugLabel: 'Splash Scaffolds',
  );
}
