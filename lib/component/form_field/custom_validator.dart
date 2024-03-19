import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class FormValidator {
  static FormValidator? _of;
  static FormValidator get of => _of ??= FormValidator._init();
  FormValidator._init();

  String? emailValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyEmail.text;
    //
    if (!value!.isValidEmailRegex) return FormError.notValidEmail.text;
    //
    return null;
  }

  String? passwordValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyPassword.text;
    //
    if (value!.length < 8) return FormError.shortPassword.text;
    //
    if (!value.isValidMediumPassword) return FormError.notValidPassword.text;
    //
    return null;
  }

  bool confirmPasswordValidator(
    TextEditingController password,
    TextEditingController confirmPassword,
  ) {
    return password.text.trim() == confirmPassword.text.trim();
  }

  String? userValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyUserName.text;
    //
    if (value!.length < FormSettings.of.userLength) {
      return FormError.shortUsername.text;
    }
    //
    return null;
  }

  String? text(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyField.text;
    //
    if (value!.length < FormSettings.of.fieldLength) {
      return FormError.shortField.text;
    }
    return null;
  }

  String? intText(String? text, TBLApartment apt) {
    if (text.isNullOrEmpty) return FormError.emptyField.text;
    if (int.tryParse(text!) == null) return FormError.integerField.text;
    if (int.parse(text) < 0) return FormError.positiveInteger.text;
    return null;
  }
}
