import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin LoginViewMixin on State<LoginForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late HiveUserRepository hiveUser;

  @override
  void initState() {
    super.initState();
    hiveUser = HiveUserRepository(boxName: MyHive.hiveUser.name);
    hiveUser.openBox();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    hiveUser.closeBox();
    super.dispose();
  }

  void userValidation() async {
    final BuildContext? mContext = ScaffoldKeys.of.loginKey.currentContext;
    if (mContext == null) return;

    if (!isValidForm()) {
      mContext.showSnackBar(SnackBar(content: Text(formErrorMessage())));
      return;
    }
    //
    final bool response = await hiveUser.getItemByUserName(
      userNameController.text.trim(),
      passwordController.text.trim(),
    );
    //
    if (!mContext.mounted) return;
    //
    if (!response) {
      mContext.showSnackBar(
        SnackBar(content: Text(AppError.notValidUserLogin.text)),
      );
      return;
    }

    mContext.pushNamedAndRemoveUntil(MyRoute.home.name);
    //
  }

  void gotoRegisterView() {
    if (context.mounted) {
      context.pushNamed(MyRoute.authRegister.name);
    }
  }

  bool isValidForm() {
    if (userNameController.text.isNullOrEmpty ||
        passwordController.text.isNullOrEmpty) {
      return false;
    }
    return true;
  }

  String formErrorMessage() {
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
