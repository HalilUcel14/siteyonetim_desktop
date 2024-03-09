import 'package:flutter/material.dart';

class BooleanNotifier extends ValueNotifier<bool> {
  BooleanNotifier(super.value);

  void change() {
    value = !value;
  }

  void setTrue() {
    value = true;
  }

  void setFalse() {
    value = false;
  }
}
