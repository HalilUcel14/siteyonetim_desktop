// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin RegisterFormMixin on State<RegisterForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    // --------------------------------
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
    // --------------------------------
    FormKeys.of.registerFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // --------------------------------
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    // --------------------------------
    FormKeys.of.registerFormKey.currentState?.dispose();
    // --------------------------------
    super.dispose();
  }

  void formValidation() async {
    //-----------------------------------
    if (!FormKeys.of.registerFormKey.safetyValidate()) return;
    //-----------------------------------
    if (!isConfirmPassword) {
      CustomSnackbar(context)
          .showError(message: FormError.notValidConfirmPassword.text);
      return;
    }
    //-----------------------------------
    final response = await context.userDB.create(
      username: userNameController.text.trim(),
      emailAddress: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    //

    if (response.hasError) {
      CustomSnackbar(context).showError(message: response.message);
      return;
    }
    //
    goToLoginView();
  }

  /// Kullanıcı Giriş Ekranına Geçiş yapar.
  void goToLoginView() =>
      authNotifier.typeLogin(); //context.pushNamed(MyRoute.authLogin.name);

  bool get isConfirmPassword =>
      passwordController.text.trim() == confirmPasswordController.text.trim();
}
