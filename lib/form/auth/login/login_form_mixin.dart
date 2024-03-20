// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin LoginFormMixin on State<LoginForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    // ------------------------
    FormKeys.of.loginFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    // ------------------------
    FormKeys.of.loginFormKey.currentState?.dispose();
    super.dispose();
  }

  void formValidation() async {
    //-----------------------------------
    // This function check the form validation
    if (!FormKeys.of.loginFormKey.safetyValidate()) return;
    //--------------------------------
    final response = await DBLoginUser.of.signIn(
      userNameController.text.trim(),
      passwordController.text.trim(),
    );
    // ------------------------
    if (!context.mounted) return;
    if (!response.hasError) {
      goToHomeView();
      return;
    }
    //--------------------------------
    CustomSnackbar(context).showError(message: response.message);
  }

  void goToHomeView() async {
    if (context.mounted) {
      await context.pushNamedAndRemoveUntil(MyRoute.home.name);
    }
  }

  void goToRegisterView() async {
    if (context.mounted) {
      await context.pushNamed(MyRoute.authRegister.name);
    }
  }

  void goToForgotPasswordView() async {
    if (context.mounted) {
      await context.pushNamed(MyRoute.authForgot.name);
    }
  }
}
