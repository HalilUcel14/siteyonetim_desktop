import 'package:flutter/material.dart';

extension FormStateExtension on GlobalKey<FormState> {
  bool safetyValidate() {
    if (currentState == null) return false;
    if (!currentState!.validate()) return false;
    return true;
  }
}
