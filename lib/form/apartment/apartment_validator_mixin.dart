import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

mixin ApartmentValidatorMixin on State<ApartmentForm> {
  // --------------------------------

  CustomFormDecoration nameDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.apartmanName.text,
    );
  }

  String? nameValidator(String? value) {
    if ((value?.length ?? 0) < FormSettings.fieldLength.value) {
      return FormError.shortField.text;
    }
    return null;
  }

  CustomFormDecoration addressDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.apartmanAdres.text,
    );
  }

  String? addressValidator(String? value) {
    if ((value?.length ?? 0) < FormSettings.fieldLength.value) {
      return FormError.shortField.text;
    }
    return null;
  }
}
