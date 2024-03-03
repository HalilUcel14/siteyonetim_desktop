import 'package:flutter/material.dart';

class BoolNotifier extends ValueNotifier<bool> {
  BoolNotifier(super.value);

  void change() {
    value = !value;
  }
}
