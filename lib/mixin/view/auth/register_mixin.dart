import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin RegisterViewMixin on State<RegisterForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController confirmPasswordController;
  late HiveUserRepository hiveUser;

  @override
  void initState() {
    super.initState();
    hiveUser = HiveUserRepository(boxName: MyHive.hiveUser.name);
    hiveUser.openBox();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    hiveUser.closeBox();
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
  }

  HiveUserRepository userRepository = HiveUserRepository(
    boxName: MyHive.hiveUser.name,
  );

  bool isValidForm() {
    if (userNameController.text.trim().isNullOrEmpty) return false;
    if (passwordController.text.trim().isNullOrEmpty) return false;
    if (confirmPasswordController.text.trim().isNullOrEmpty) return false;
    if (emailController.text.trim().isNullOrEmpty) return false;
    if (!emailController.text.trim().isValidEmailRegex) return false;
    if (passwordController.text.trim().isValidMediumPassword) return false;
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

    if (emailController.text.trim().isNullOrEmpty) {
      return AppError.emptyEmailAddress.text;
    }

    if (!emailController.text.trim().isValidEmailRegex) {
      return AppError.notValidEmailAddress.text;
    }

    if (!passwordController.text.trim().isValidMediumPassword) {
      return AppError.notValidMediumPassword.text;
    }
    return "";
  }

  void userValidation() async {
    final BuildContext? mContext = ScaffoldKeys.of.registerKey.currentContext;
    if (mContext == null) return;
    if (!mContext.mounted) return;

    ///
    if (!mContext.mounted) return;
    if (!isValidForm()) {
      mContext.showSnackBar(SnackBar(content: Text(formErrorMessage())));
      return;
    }
    //
    HiveUser user = HiveUser(
      uid: RandomKey.generate(),
      username: userNameController.text.trim(),
      emailAddress: emailController.text.trim(),
      password: passwordController.text.trim(),
      createdAt: DateTime.now(),
      role: UserRole.manager.name,
    );
    //
    if (user.uid.isNullOrEmpty) return;
    //
    userRepository.addItem(user.uid!, user);
    //
    gotoLoginView();
  }

  void gotoLoginView() {
    if (context.mounted) {
      context.pushNamed(MyRoute.authLogin.name);
    }
  }
}
