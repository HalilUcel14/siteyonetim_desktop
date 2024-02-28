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
  late HiveDatabaseManager<HiveUser> userBox;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userBox = HiveDatabaseManager<HiveUser>();
    userBox.openBox();
  }

  @override
  void dispose() {
    super.dispose();
    userBox.closeBox();
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
  }

  bool isValidForm() {
    if (userNameController.text.trim().isNullOrEmpty) return false;
    if (passwordController.text.trim().isNullOrEmpty) return false;
    if (confirmPasswordController.text.trim().isNullOrEmpty) return false;
    if (emailController.text.trim().isNullOrEmpty) return false;
    if (!emailController.text.trim().isValidEmailRegex) return false;
    if (!passwordController.text.trim().isValidMediumPassword) return false;
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
    BuildContext? mContext = ScaffoldKeys.of.registerKey.currentContext;
    mContext ??= context;
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
      userType: UserType.free.name,
    );
    //
    if (user.uid.isNullOrEmpty) return;
    await userBox.openBox();
    print(userBox.box.isOpen);
    await userBox.addBox(user.uid!, user);
    //
    gotoLoginView();
  }

  // TODO: Hive is box add error

  void gotoLoginView() {
    if (context.mounted) {
      context.pushNamed(MyRoute.authLogin.name);
    }
  }
}
