import 'package:flutter/material.dart';

mixin LoginFormMixin<T extends StatefulWidget> {
  late final BoxConstraints constraints;
  bool showPass = false;
  late final TextEditingController userNameController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final Function() userValidation;
  late final Function() gotoRegisterView;
}
