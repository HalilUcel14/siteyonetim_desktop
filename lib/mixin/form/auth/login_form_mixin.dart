import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin LoginFormMixin on State<LoginForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late HiveUserDatabase hiveUser;
  late AppMetaDataBase metaData;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    hiveUser = HiveUserDatabase();
    metaData = AppMetaDataBase();
    FormKeys.of.loginFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    hiveUser.closeBox();
    metaData.closeBox();
    super.dispose();
  }

  formValidation() async {
    if (!_isValidForm()) {
      if (!context.mounted) return;
      context.showSnackBar(SnackBar(content: Text(_formErrorMessage())));
    }
    //
    final user = hiveUser.checkUser(
      userNameController.text.trim(),
      passwordController.text.trim(),
    );

    if (user.uid.isNullOrEmpty) {
      if (!context.mounted) return;
      context.showSnackBar(
        SnackBar(content: Text(AppError.notValidUserLogin.text)),
      );
      return;
    }
    //
    final bool response = await metaData.logInUser(user);
    //
    if (!response) {
      if (!context.mounted) return;
      // ignore: use_build_context_synchronously
      context.showSnackBar(
        SnackBar(content: Text(AppError.errorLoginUser.text)),
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

  ///
  bool _isValidForm() {
    if (userNameController.text.isNullOrEmpty) return false;
    if (passwordController.text.isNullOrEmpty) return false;
    return true;
  }

  ///
  String _formErrorMessage() {
    if (userNameController.text.trim().isNullOrEmpty) {
      return AppError.emptyUserName.text;
    }
    if (passwordController.text.trim().isNullOrEmpty) {
      return AppError.emptyPassword.text;
    }
    if (!passwordController.text.trim().isValidMediumPassword) {
      return AppError.notValidMediumPassword.text;
    }
    return "";
  }
}
