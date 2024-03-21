import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

mixin RegisterFormValidatorMixin on State<RegisterForm> {
  late BoolNotifier isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = BoolNotifier(true);
  }

  @override
  void dispose() {
    isObscure.dispose();
    super.dispose();
  }

  CustomFormDecoration get userNameDecoration => CustomFormDecoration(
        context,
        labelText: FormText.usernameLabel.text,
        suffixIcon: const Icon(Icons.person),
      );

  String? userNameValidator(String? value) {
    if ((value?.length ?? 0) < FormSettings.fieldLength.value) {
      return FormError.shortField.text;
    }
    return null;
  }

  CustomFormDecoration get emailDecoration => CustomFormDecoration(
        context,
        labelText: FormText.emailLabel.text,
        suffixIcon: const Icon(Icons.email),
      );

  String? emailValidator(String? value) {
    if (value.isNullOrEmpty) return FormError.emptyField.text;
    if (!value!.isValidEmailRegex) {
      return FormError.notValidEmail.text;
    }
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
    if (value.isNullOrEmpty) return FormError.emptyField.text;
    if (!value!.isValidMediumPassword) {
      return FormError.notValidPassword.text;
    }
    return null;
  }

  CustomFormDecoration get confirmDecoration => CustomFormDecoration(
        context,
        labelText: FormText.confirmPasswordLabel.text,
        hintText: FormText.confirmPasswordHint.text,
        suffixIcon: GestureDetector(
          onTap: () => isObscure.change(),
          child: isObscure.value
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      );
}
