// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin LoginFormMixin on State<LoginForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late BoolNotifier isObscure;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    // ------------------------
    isObscure = BoolNotifier(true);
    FormKeys.of.loginFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    // ------------------------
    isObscure.dispose();
    FormKeys.of.loginFormKey.currentState?.dispose();
    super.dispose();
  }

  void formValidation() async {
    //-----------------------------------
    // This function check the form validation
    if (!FormKeys.of.loginFormKey.safetyValidate()) return;
    //--------------------------------
    if (DBLoginUser().signIn(
      userNameController.text.trim(),
      passwordController.text.trim(),
    )) {
      return goToHomeView();
    }
    //--------------------------------
    if (!context.mounted) return;
    // ------------------------
    context.showSnackBar(
      SnackBar(
          content: Text(
        FormError.errorUserSign.text,
      )),
    );
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
