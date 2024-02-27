import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

final class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return ColumnWithSpacing(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SizeEnum.tetra.size,
      children: [
        // -----------------------------
        CustomTextFormField(
          context,
          controller: userNameController,
          labelText: AppForm.usernameLabel.text,
        ),
        // -----------------------------
        CustomTextFormField(
          context,
          controller: passwordController,
          labelText: AppForm.passwordLabel.text,
          obscureText: true,
        ),
        // -----------------------------
        RowWithSpacing(
          spacing: SizeEnum.ennea.size,
          children: [
            ElevatedButton(
              onPressed: userValidation,
              child: Text(AppForm.signInButton.text),
            ),
            // -----------------------------
            ElevatedButton(
              onPressed: gotoRegisterView,
              child: Text(AppForm.signUpButton.text),
            ),
          ],
        ).horizontalScrollView
      ],
    ).padding(pad: SizeEnum.hexa.size.withPaddingAll).verticalScrollView;
  }
}
