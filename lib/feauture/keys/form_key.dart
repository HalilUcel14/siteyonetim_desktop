import 'package:flutter/material.dart';

final class FormKeys {
  static FormKeys? _of;
  static FormKeys get of => _of ??= FormKeys._();
  FormKeys._();

  late GlobalKey<FormState> registerFormKey;
  late GlobalKey<FormState> loginFormKey;
}