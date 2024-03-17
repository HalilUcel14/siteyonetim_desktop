import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../index.dart';

class CustomFormField {
  BuildContext context;
  static CustomFormField? _of;
  static CustomFormField of(BuildContext context) =>
      _of ??= CustomFormField._(context);
  CustomFormField._(this.context);

  //

  TextFormField userForm(TextEditingController controller) {
    return CustomTextFormField(
      context,
      controller: controller,
      labelText: FormText.usernameLabel.text,
      hintText: FormText.usernameHint.text,
      validator: (value) => FormValidator.of.userValidator(value),
    );
  }

  TextFormField emailForm(TextEditingController controller) {
    return CustomTextFormField(
      context,
      controller: controller,
      labelText: FormText.emailLabel.text,
      hintText: FormText.emailHint.text,
      validator: (value) => FormValidator.of.emailValidator(value),
    );
  }

  TextFormField _passwordForm(
      TextEditingController controller, BoolNotifier obscure) {
    return CustomTextFormField(
      context,
      controller: controller,
      labelText: FormText.passwordLabel.text,
      hintText: FormText.passwordHint.text,
      obscureText: obscure.value,
      validator: (value) => FormValidator.of.passwordValidator(value),
      suffixIcon: IconButton(
        onPressed: () => obscure.change(),
        icon: Icon(
          obscure.value
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
      ),
    );
  }

  ValueListenableBuilder<bool> passwordForm(
      BoolNotifier obscure, TextEditingController controller) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscure,
      builder: (context, obscureValue, child) {
        return _passwordForm(controller, obscure);
      },
    );
  }
}
