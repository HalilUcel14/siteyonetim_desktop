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

class _RegisterFormState extends State<RegisterForm>
    with RegisterFormMixin, RegisterFormValidatorMixin {
  @override
  Widget build(BuildContext context) {
    return CustomFormView(
      formKey: FormKeys.of.registerFormKey,
      children: [
        // ---------------------------------
        CustomTextFormField(
          controller: userNameController,
          decoration: userNameDecoration,
          forceField: true,
          validator: (value) => userNameValidator(value),
        ),
        // ---------------------------------
        CustomTextFormField(
          controller: emailController,
          decoration: emailDecoration,
          forceField: true,
          validator: (value) => emailValidator(value),
        ),
        // --------------------------------
        ValueListenableBuilder(
          valueListenable: isObscure,
          builder: (context, obscure, child) {
            return CustomTextFormField(
              controller: passwordController,
              decoration: passwordDecoration,
              obscureText: obscure,
              forceField: true,
              validator: (value) => passwordValidator(value),
            );
          },
        ),
        // --------------------------------
        ValueListenableBuilder(
          valueListenable: isObscure,
          builder: (context, obscure, child) {
            return CustomTextFormField(
              controller: confirmPasswordController,
              decoration: confirmDecoration,
              obscureText: obscure,
              forceField: true,
              validator: (value) => passwordValidator(value),
            );
          },
        ),
        // --------------------------------
        RowWithSpacing(
          spacing: SizeType.ennea.size,
          children: [
            ElevatedButton(
              onPressed: formValidation,
              child: WBoldText(FormText.signUpButton.text),
            ),
            // --------------------------------------
            ElevatedButton(
              onPressed: goToLoginView,
              child: WBoldText(FormText.signInButton.text),
            ),
          ],
        ).scrollHorizontal(),
        // --------------------------------
      ],
    );

    //
  }
}
