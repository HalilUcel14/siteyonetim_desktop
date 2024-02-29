import 'package:app_hive/index.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin LoginViewMixin on State<LoginForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late GlobalKey<ScaffoldState> key;
  late HiveUserDatabase hiveUser;
  late AppMetaDataBase metaData;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    key = GlobalKey<ScaffoldState>();
    hiveUser = HiveUserDatabase();
    metaData = AppMetaDataBase();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    key.currentState?.dispose();
    super.dispose();
  }

  void userValidation() async {
    BuildContext? mContext = key.currentContext;
    mContext ??= context;
    //
    //
    if (!isValidForm()) {
      mContext.showSnackBar(SnackBar(content: Text(formErrorMessage())));
      return;
    }
    //
    final HiveUser response = hiveUser.checkUser(
      userNameController.text.trim(),
      passwordController.text.trim(),
    );
    // -------------------------------------------
    if (response.uid == null) {
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
    await metaData.updateBox(AppString.metaDataId.text, data);
    // -------------------------------------------
    // -------------------------------------------
    if (!mContext.mounted) return;
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
