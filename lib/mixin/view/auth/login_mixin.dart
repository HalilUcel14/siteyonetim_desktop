import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin LoginViewMixin on State<LoginForm> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isValidForm() {
    if (userNameController.text.isNullOrEmpty ||
        passwordController.text.isNullOrEmpty) {
      return false;
    }
    return true;
  }

  void userValidation() async {
    if (isValidForm()) {
      final userRepository = HiveUserRepository(boxName: MyHive.hiveUser.name);
      //
      final response = await userRepository.getItemByUserName(
        userNameController.text.trim(),
        passwordController.text.trim(),
      );
      //

      if (response) {
        if (context.mounted) {
          context.pushNamedAndRemoveUntil(MyRoute.home.name);
        }
      } else {
        if (context.mounted) {
          context.showSnackBar(
            SnackBar(
              content: Text(AppError.notValidUserLogin.text),
            ),
          );
        }
      }
    }
  }

  void gotoRegisterView() {
    if (context.mounted) {
      context.pushNamed(MyRoute.authRegister.name);
    }
  }
}
