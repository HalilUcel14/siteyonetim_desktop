import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

final class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
  }) : super(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
            contentPadding: ViewEnum.hexa.size.withPaddingAll,
          ),
        );
}
