import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin RegisterFormMixin on State<RegisterForm> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<ScaffoldState> key;
  late HiveUserDatabase userBox;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
    key = GlobalKey<ScaffoldState>();
    userBox = HiveUserDatabase();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    key.currentState?.dispose();
  }

  void userValidation() async {
    BuildContext? mContext = key.currentContext;
    mContext ??= context;

    //
    if (!isValidForm()) {
      if (!mContext.mounted) return;
      mContext.showSnackBar(SnackBar(content: Text(formErrorMessage())));
    }
    //
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

    await userBox.openBox();
    final response = await userBox.addBox(user.uid!, user);
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
