import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/widget/line_container/line_container.dart';

import '../../../index.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.notifier});

  final AuthTypeNotifier notifier;

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
          minimumValueLenght: FormSettings.fieldLength.value.toInt(),
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
              minimumValueLenght: FormSettings.passwordLength.value.toInt(),
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
              minimumValueLenght: FormSettings.passwordLength.value.toInt(),
              forceField: true,
              validator: (value) => passwordValidator(value),
            );
          },
        ),
        // --------------------------------
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(SizeType.deca.size, SizeType.penta.size),
            ),
            onPressed: formValidation,
            child: WBoldText(
              text: FormText.signUpButton.text,
            )),
        // --------------------------------
        LineContainer(context),
        // --------------------------------
        RowWithSpacing(
          children: [
            // --------------------------------
            WBoldText(text: FormText.or.text),
            // --------------------------------
            TextButton(
              onPressed: goToLoginView,
              child: WBoldText(
                wColor: WColor.primary,
                text: FormText.signInButton.text,
              ),
            )
          ],
        ).scrollHorizontal(),
      ],
    );
  }
}
