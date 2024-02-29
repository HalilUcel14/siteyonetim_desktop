import 'package:flutter/material.dart';

mixin RegisterFormMixin<T extends StatefulWidget> {
  late final BoxConstraints constraints;
  bool showPass = false;
  late final TextEditingController userNameController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController confirmPasswordController =
      TextEditingController();
  late final Function() userValidation;
  late final Function() gotoLoginView;
}
