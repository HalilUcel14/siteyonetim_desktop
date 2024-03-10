import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with RegisterFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKeys.of.registerFormKey,
      child: ColumnWithSpacing(
        spacing: SizeEnum.tetra.size,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ---------------------------------
          CustomTextFormField(
            context,
            controller: userNameController,
            labelText: FormText.usernameLabel.text,
            validator: (value) => FormValidation.of.text(
              value,
              FormText.usernameLabel.text,
            ),
          ),
          // ---------------------------------
          CustomTextFormField(
            context,
            controller: emailController,
            labelText: FormText.emailLabel.text,
            validator: (value) => FormValidation.of.emailText(
              value,
              FormText.emailHint.text,
            ),
          ),
          // --------------------------------
          PasswordFormField(
            valueListenable: isObscure,
            passwordController: passwordController,
            labelText: FormText.passwordLabel.text,
          ),
          // --------------------------------
          PasswordFormField(
            valueListenable: isObscure,
            passwordController: confirmPasswordController,
            labelText: FormText.passwordLabel.text,
          ),
          // --------------------------------
          // --------------------------------
          RowWithSpacing(
            spacing: SizeEnum.ennea.size,
            children: [
              ElevatedButton(
                onPressed: formValidation,
                child: Text(FormText.signUpButton.text),
              ),
              // --------------------------------------
              ElevatedButton(
                onPressed: goToLoginView,
                child: Text(FormText.signInButton.text),
              ),
            ],
          ).horizontalScrollView
        ],
      ).padding(pad: SizeEnum.hexa.size.withPaddingAll).verticalScrollView,
    );
  }
}