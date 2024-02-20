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
    return SingleChildScrollView(
      // ------------------------
      child: ColumnWithSpacing(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: userNameController,
            labelText: AppForm.usernameLabel.text,
          ),
          // -----------------------------
          CustomTextFormField(
            controller: passwordController,
            labelText: AppForm.passwordLabel.text,
            obscureText: true,
          ),
          // -----------------------------
          RowWithSpacing(
            children: [
              ElevatedButton(
                onPressed: userValidation,
                child: Text(AppForm.signInButton.text),
              ),
              ElevatedButton(
                onPressed: gotoRegisterView,
                child: Text(AppForm.signUpButton.text),
              ),
            ],
          )
        ],
      ).padding(
        pad: ViewEnum.hexa.size.withPaddingAll,
      ),
    );
  }
}
