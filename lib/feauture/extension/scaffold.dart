import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

extension ScaffoldStateExtension on GlobalKey<ScaffoldState> {
  void get openDrawerSafety {
    if (currentState == null) return;
    if (currentState!.isDrawerOpen) return;
    currentState!.openDrawer();
  }

  Future<void> pushNamed(String name) async {
    if (currentContext == null) return;
    if (!currentContext!.mounted) return;
    await currentContext!.pushNamed(name);
  }

  Future<void> pushNamedAndRemoveUntil(String name) async {
    if (currentContext == null) return;
    if (!currentContext!.mounted) return;
    await currentContext!.pushNamedAndRemoveUntil(name);
  }
}
