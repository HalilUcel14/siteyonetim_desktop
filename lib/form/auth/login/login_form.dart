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

class _LoginFormState extends State<LoginForm>
    with LoginFormMixin, LoginFormValidatorMixin {
  @override
  Widget build(BuildContext context) {
    return CustomFormView(
      formKey: FormKeys.of.loginFormKey,
      children: [
        // ------------------------
        CustomTextFormField(
          controller: userNameController,
          decoration: userNameDecoration,
          forceField: true,
          minimumValueLenght: FormSettings.userLength.value.toInt(),
          validator: (value) => userNameValidator(value),
        ),
        // ------------------------
        ValueListenableBuilder(
          valueListenable: isObscure,
          builder: (context, obscure, child) {
            return CustomTextFormField(
              controller: passwordController,
              obscureText: obscure,
              forceField: true,
              minimumValueLenght: FormSettings.passwordLength.value.toInt(),
              decoration: passwordDecoration,
              validator: (value) => passwordValidator(value),
            );
          },
        ),
        // ------------------------
        RowWithSpacing(
          spacing: SizeType.ennea.size,
          children: [
            ElevatedButton(
              onPressed: formValidation,
              child: WBoldText(FormText.signInButton.text),
            ),
            // ------------------------
            ElevatedButton(
              onPressed: goToRegisterView,
              child: WBoldText(FormText.signUpButton.text),
            ),
          ],
        ).scrollHorizontal()
      ],
    );
  }
}
