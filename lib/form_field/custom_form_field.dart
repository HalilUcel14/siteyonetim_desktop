import 'package:app_hive/app_hive.dart';
import 'package:flutter/material.dart';

import '../index.dart';

class CustomFormField {
  BuildContext context;
  //
  CustomFormField(this.context);

  TextFormField emailForm(TextEditingController controller) {
    return CustomTextFormField(
      context,
      controller: controller,
      labelText: FormText.emailLabel.text,
      hintText: FormText.emailHint.text,
      validator: (value) => FormValidator.of.emailValidator(value),
    );
  }

  TextFormField passwordForm(TextEditingController controller) {
    return CustomTextFormField(
      context,
      controller: controller,
      labelText: FormText.passwordLabel.text,
      hintText: FormText.passwordHint.text,
      obscureText: true,
      validator: (value) => FormValidator.of.passwordValidator(value),
    );
  }
}
