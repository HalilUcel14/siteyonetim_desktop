import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
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
    return CustomFormView(
      formKey: FormKeys.of.registerFormKey,
      children: [
        // ---------------------------------
        // CustomFormField.of(context).userForm(userNameController),
        // // ---------------------------------
        // CustomFormField.of(context).emailForm(emailController),
        // // --------------------------------
        // CustomFormField.of(context).passwordForm(isObscure, passwordController),
        // // --------------------------------
        // CustomFormField.of(context).passwordForm(
        //   isObscure,
        //   confirmPasswordController,
        // ),
        // --------------------------------
        RowWithSpacing(
          spacing: SizeType.ennea.size,
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
        ).scrollHorizontal(),
        // --------------------------------
      ],
    );

    //
  }
}
