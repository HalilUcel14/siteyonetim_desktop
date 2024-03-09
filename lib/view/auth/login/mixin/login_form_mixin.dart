// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

mixin LoginFormMixin on State<LoginForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late BoolNotifier isObscure;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    isObscure = BoolNotifier(true);
    FormKeys.of.loginFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    isObscure.dispose();
    FormKeys.of.loginFormKey.currentState?.dispose();
    super.dispose();
  }

  void changeObscure() => isObscure.change();

  formValidation() async {
    if (!context.mounted) return;
    //-----------------------------------
    if (FormKeys.of.loginFormKey.currentState == null) return;
    //-----------------------------------
    if (!FormKeys.of.loginFormKey.currentState!.validate()) return;
    //-----------------------------------
    final user = HiveBoxesObject.of.userDB.checkLoginUser(
      userNameController.text.trim(),
      passwordController.text.trim(),
    );
    //-----------------------------------
    if (user.uid.isNullOrEmpty) {
      context.showSnackBar(
        SnackBar(content: Text(FormError.emptyUserName.text)),
      );
      return;
    }
    //-----------------------------------
    final bool response = await HiveBoxesObject.of.metaDB.logInUser(user);
    //---------------------------------
    if (!context.mounted) return;
    //
    if (!response) {
      context.showSnackBar(
        SnackBar(content: Text(FormError.errorUserSign.text)),
      );
      return;
    }
    //
    goToHomeView();
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
}
