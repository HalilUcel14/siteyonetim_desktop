import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

mixin RegisterFormMixin on State<RegisterForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController confirmPasswordController;

  late HiveUserDatabase userBox;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
    FormKeys.of.registerFormKey = GlobalKey<FormState>();
    userBox = HiveUserDatabase();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void userValidation() async {
    BuildContext? mContext = FormKeys.of.registerFormKey.currentContext;
    mContext ??= context;

    //
    if (!isValidForm()) {
      if (!mContext.mounted) return;
      mContext.showSnackBar(SnackBar(content: Text(formErrorMessage())));
    }
    //
    await userBox.openBox();
    final response = await userBox.addNewUser(
      username: userNameController.text.trim(),
      password: passwordController.text.trim(),
      email: emailController.text.trim(),
    );
    //
    if (!mContext.mounted) return;
    if (response) {
      goToLoginView();
    } else {
      mContext.showSnackBar(
        const SnackBar(
          content: Text('Kayıt İşlemi Başarısız'),
        ),
      );
    }
  }

  /// Kullanıcı Giriş Ekranına Geçiş yapar.
  void goToLoginView() {
    if (!context.mounted) return;
    context.pushNamed(MyRoute.authLogin.name);
  }

  /// Tüm Controller içerisindeki değerleri kontrol eder.
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

  /// Kontroller içerisinde bir hata var ise mesaj döndürür;
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
}
