import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

final class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with LoginFormMixin {
  @override
  Widget build(BuildContext context) {
    return CustomFormView(
      formKey: FormKeys.of.loginFormKey,
      children: [
        // ------------------------
        CustomFormField.of(context).userForm(userNameController),
        // ------------------------
        CustomFormField.of(context).passwordForm(
          isObscure,
          passwordController,
        ),
        // ------------------------
        RowWithSpacing(
          spacing: SizeType.ennea.size,
          children: [
            ElevatedButton(
              onPressed: formValidation,
              child: Text(FormText.signInButton.text),
            ),
            ElevatedButton(
              onPressed: goToRegisterView,
              child: Text(FormText.signUpButton.text),
            ),
          ],
        ).scrollHorizontal()
      ],
    );
  }
}
