import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin RegisterViewMixin on State<RegisterForm> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  HiveUserRepository userRepository = HiveUserRepository(
    boxName: MyHive.hiveUser.name,
  );

  bool isValidForm() {
    if (userNameController.text.trim().isNullOrEmpty) return false;
    if (passwordController.text.trim().isNullOrEmpty) return false;
    if (confirmPasswordController.text.trim().isNullOrEmpty) return false;
    if (confirmPasswordController.text.trim() !=
        passwordController.text.trim()) {
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
    if (confirmPasswordController.text.trim().isNullOrEmpty) {
      return AppError.emptyPassword.text;
    }
    if (confirmPasswordController.text.trim() !=
        passwordController.text.trim()) {
      return AppError.notConfirmPassword.text;
    }
    return "";
  }

  void userValidation() async {
    if (!isValidForm()) {
      if (context.mounted) {
        context.showSnackBar(
          SnackBar(
            content: Text(
              formErrorMessage(),
            ),
          ),
        );
      }
    } else {
      //
      HiveUser user = HiveUser(
        id: RandomKey.generate(),
        username: userNameController.text.trim(),
        password: passwordController.text.trim(),
        createdAt: DateTime.now(),
        role: UserRole.manager.name,
      );
      //
      if (user.id.isNullOrEmpty) return;
      //
      userRepository.addItem(user.id!, user);
      //
      gotoLoginView();
    }
  }

  void gotoLoginView() {
    if (context.mounted) {
      context.pushNamed(MyRoute.authLogin.name);
    }
  }
}
