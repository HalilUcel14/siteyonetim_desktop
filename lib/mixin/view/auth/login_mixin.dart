import 'package:app_hive/index.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin LoginViewMixin on State<LoginForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late HiveDatabaseManager<HiveUser> userBox;
  late HiveDatabaseManager<AppMetaData> metaBox;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    userBox = HiveDatabaseManager<HiveUser>();
    metaBox = HiveDatabaseManager<AppMetaData>();
    userBox.openBox();
    metaBox.openBox();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    userBox.closeBox();
    metaBox.closeBox();
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
    final HiveUser? response = await userBox.isHasUser(
      userNameController.text.trim(),
      passwordController.text.trim(),
    );
    // -------------------------------------------
    if (response == null) {
      if (!mContext.mounted) return;
      mContext.showSnackBar(
        SnackBar(content: Text(AppError.notValidUserLogin.text)),
      );
      return;
    }
    // -------------------------------------------
    final data = AppMetaData(
      uid: RandomKey.generate(),
      user: response,
      lastSign: DateTime.now(),
    );
    // -------------------------------------------
    // -------------------------------------------
    await metaBox.updateBox(AppString.metaDataId.text, data);
    if (!mContext.mounted) return;
    // -------------------------------------------
    // -------------------------------------------
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
