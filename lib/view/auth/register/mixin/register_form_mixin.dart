// ignore_for_file: use_build_context_synchronously

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
  late BoolNotifier isObscure = BoolNotifier(false);

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
    FormKeys.of.registerFormKey = GlobalKey<FormState>();
    isObscure = BoolNotifier(true);
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    isObscure.dispose();
    FormKeys.of.registerFormKey.currentState?.dispose();
    super.dispose();
  }

  void formValidation() async {
    if (!context.mounted) return;
    //-----------------------------------
    if (FormKeys.of.registerFormKey.currentState == null) return;
    //-----------------------------------
    if (!FormKeys.of.registerFormKey.currentState!.validate()) return;
    //-----------------------------------
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      context.showSnackBar(
        const SnackBar(
          content: Text('Şifreler Uyuşmuyor'),
        ),
      );
      return;
    }
    //-----------------------------------
    final response = await HiveBoxesObject.of.userDB.addNewUser(
      username: userNameController.text.trim(),
      password: passwordController.text.trim(),
      email: emailController.text.trim(),
    );
    //
    if (!context.mounted) return;
    if (!response) {
      context.showSnackBar(
        const SnackBar(
          content: Text(
            'Kayıt İşlemi Başarısız Email yada UserName daha önce kullanılmış olabilir.',
          ),
        ),
      );
      return;
    }
    //
    goToLoginView();
  }

  /// Kullanıcı Giriş Ekranına Geçiş yapar.
  void goToLoginView() => context.pushNamed(MyRoute.authLogin.name);
}
