import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

mixin LoginFormValidatorMixin on State<LoginForm> {
  late BoolNotifier isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = BoolNotifier(true);
  }

  CustomFormDecoration get userNameDecoration => CustomFormDecoration(
        context,
        labelText: FormText.usernameLabel.text,
        hintText: FormText.usernameHint.text,
        suffixIcon: const Icon(Icons.person),
      );

  String? userNameValidator(String? value) {
    if ((value?.length ?? 0) < 3) return FormError.shortUsername.text;
    return null;
  }

  CustomFormDecoration get passwordDecoration => CustomFormDecoration(
        context,
        labelText: FormText.passwordLabel.text,
        hintText: FormText.passwordHint.text,
        suffixIcon: GestureDetector(
          onTap: () => isObscure.change(),
          child: isObscure.value
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      );

  String? passwordValidator(String? value) {
    if ((value?.length ?? 0) < FormSettings.passwordLength.value) {
      return FormError.shortPassword.text;
    }
    return null;
  }
}
