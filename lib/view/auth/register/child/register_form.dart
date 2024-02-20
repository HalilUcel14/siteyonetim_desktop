import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../index.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // ----------------------
      child: ColumnWithSpacing(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: userNameController,
            labelText: AppForm.usernameLabel.text,
          ),
          // --------------------------------
          CustomTextFormField(
            controller: passwordController,
            labelText: AppForm.passwordLabel.text,
          ),
          // --------------------------------
          CustomTextFormField(
            controller: confirmPasswordController,
            labelText: AppForm.passwordLabel.text,
          ),
          // --------------------------------
          RowWithSpacing(
            children: [
              ElevatedButton(
                onPressed: userValidation,
                child: Text(
                  AppForm.signUpButton.text,
                ),
              ),
              // --------------------------------------
              ElevatedButton(
                onPressed: gotoLoginView,
                child: Text(
                  AppForm.signInButton.text,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
