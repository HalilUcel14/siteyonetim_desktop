import 'package:flutter/material.dart';

final class ScaffoldKeys {
  static ScaffoldKeys? _of;
  static ScaffoldKeys get of => _of ??= ScaffoldKeys._();
  ScaffoldKeys._();

  late GlobalKey<ScaffoldState> loginKey;

  late GlobalKey<ScaffoldState> registerKey;

  late GlobalKey<ScaffoldState> splashKey;

  late GlobalKey<ScaffoldState> homeKey;

  late GlobalKey<ScaffoldState> apartmentKey;
}
