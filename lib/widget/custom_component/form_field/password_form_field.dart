import 'package:app_hive/app_hive.dart';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.valueListenable,
    required this.passwordController,
    required this.labelText,
  });

  final BoolNotifier valueListenable;
  final TextEditingController passwordController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (context, obscure, child) {
        return CustomTextFormField(
          context,
          controller: passwordController,
          labelText: labelText,
          obscureText: obscure,
          validator: (value) => FormValidation.of.passwordText(
            value,
            labelText,
          ),
          suffixIcon: IconButton(
            onPressed: () => valueListenable.change(),
            icon: Icon(
              obscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        );
      },
    );
  }
}
