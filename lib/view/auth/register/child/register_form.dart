import 'package:codeofland/codeofland.dart';
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
    return ColumnWithSpacing(
      spacing: SizeEnum.tetra.size,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ---------------------------------
        CustomTextFormField(
          context,
          controller: userNameController,
          labelText: AppForm.usernameLabel.text,
        ),
        // --------------------------------
        CustomTextFormField(
          context,
          controller: passwordController,
          labelText: AppForm.passwordLabel.text,
        ),
        // --------------------------------
        CustomTextFormField(
          context,
          controller: confirmPasswordController,
          labelText: AppForm.passwordLabel.text,
        ),
        // --------------------------------
        RowWithSpacing(
          spacing: SizeEnum.ennea.size,
          children: [
            ElevatedButton(
              onPressed: userValidation,
              child: Text(AppForm.signUpButton.text),
            ),
            // --------------------------------------
            ElevatedButton(
              onPressed: gotoLoginView,
              child: Text(AppForm.signInButton.text),
            ),
          ],
        ).horizontalScrollView
      ],
    ).padding(pad: SizeEnum.hexa.size.withPaddingAll).verticalScrollView;
  }
}
