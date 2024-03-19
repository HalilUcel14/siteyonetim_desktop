import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

mixin LoginFormValidatorMixin on State<LoginForm> {
  CustomFormDecoration get userNameDecoration => CustomFormDecoration(
        context,
        labelText: FormText.usernameLabel.text,
        hintText: FormText.usernameHint.text,
        prefixIcon: Icon(Icons.person),
      );

  String? userNameValidator(String? value) {
    if ((value?.length ?? 0) < 3) return FormError.shortField.text;
    return null;
  }
}
