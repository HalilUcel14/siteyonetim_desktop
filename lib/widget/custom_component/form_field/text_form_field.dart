import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

final class CustomTextFormField extends TextFormField {
  CustomTextFormField(
    BuildContext context, {
    super.key,
    required TextEditingController controller,
    required String labelText,
    String? hintText,
    super.validator,
    super.readOnly,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) : super(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            prefixIcon: Padding(
              padding: SizeEnum.hexa.size.withPaddingLeft,
              child: prefixIcon,
            ),
            suffixIcon: Padding(
              padding: SizeEnum.hexa.size.withPaddingRight,
              child: suffixIcon,
            ),
            errorBorder: FormOutlineBorder(context.colorScheme.error),
            enabledBorder: FormOutlineBorder(context.colorScheme.primary),
            focusedBorder: FormOutlineBorder(context.colorScheme.secondary),
            focusedErrorBorder: FormOutlineBorder(
              context.colorScheme.errorContainer,
            ),
            disabledBorder: FormOutlineBorder(context.colorScheme.surface),
            border: FormOutlineBorder(Colors.black),
            contentPadding: SizeEnum.ennea.size.withPaddingAll,
          ),
        );
}
