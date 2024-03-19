import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

mixin ApartmentValidatorMixin on State<ApartmentForm> {
  // --------------------------------
  String? nameValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyField.text;
    //
    if (value!.length < FormSettings.of.fieldLength) {
      return FormError.shortField.text;
    }
    return null;
  }
}
