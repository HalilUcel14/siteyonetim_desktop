import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/mixin/form/auth/login_form_mixin.dart';

import '../../index.dart';

final class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with LoginFormMixin {
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
          labelText: FormText.usernameLabel.text,
        ),
        // -----------------------------
        CustomTextFormField(
          context,
          controller: passwordController,
          labelText: FormText.passwordLabel.text,
          obscureText: true,
        ),
        // -----------------------------
        RowWithSpacing(
          spacing: SizeEnum.ennea.size,
          children: [
            ElevatedButton(
              onPressed: formValidation,
              child: Text(FormText.signInButton.text),
            ),
            // -----------------------------
            ElevatedButton(
              onPressed: goToRegisterView,
              child: Text(FormText.signUpButton.text),
            ),
          ],
        ).horizontalScrollView
      ],
    ).padding(pad: SizeEnum.hexa.size.withPaddingAll).verticalScrollView;
  }
}
