import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

final class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with LoginFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKeys.of.loginFormKey,
      child: ColumnWithSpacing(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: SizeEnum.tetra.size,
        children: [
          // -----------------------------
          CustomTextFormField(
            context,
            controller: userNameController,
            labelText: FormText.usernameLabel.text,
            validator: (value) => FormValidation.of.text(
              value,
              FormText.usernameLabel.text,
            ),
          ),
          // -----------------------------
          PasswordFormField(
            valueListenable: isObscure,
            passwordController: passwordController,
            labelText: FormText.passwordLabel.text,
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
      ).padding(pad: SizeEnum.hexa.size.withPaddingAll).verticalScrollView,
    );
  }
}
