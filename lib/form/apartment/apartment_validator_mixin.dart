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
    return null;
  }

  CustomFormDecoration addressDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.apartmanAdres.text,
    );
  }

  String? addressValidator(String? value) {
    return null;
  }

  CustomFormDecoration floorCountDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.apartmanFloor.text,
    );
  }

  String? floorCountValidator(String value) {
    if (int.tryParse(value) == null) {
      return FormError.integerField.text;
    }
    if (int.parse(value) < 1) {
      return FormError.positiveInteger.text;
    }
    return null;
  }

  CustomFormDecoration flatsCountDecoration() {
    return CustomFormDecoration(
      context,
      labelText: FormText.apartmanFlats.text,
    );
  }

  String? flatsCountValidator(String value) {
    if (int.tryParse(value) == null) {
      return FormError.integerField.text;
    }
    if (int.parse(value) < 1) {
      return FormError.positiveInteger.text;
    }
    return null;
  }

  CustomFormDecoration buildYearDecoration(Widget suffix) {
    return CustomFormDecoration(
      context,
      labelText: FormText.apartmanYear.text,
      suffixIcon: suffix,
    );
  }

  String? buildYearValidator(String value) {
    if (DateTime.tryParse(value) == null) {
      return FormError.dateField.text;
    }
    if (DateTime.parse(value).year < FormSettings.minimumYear.value.toInt()) {
      return FormError.minimumDate.text;
    }
    return null;
  }
}
