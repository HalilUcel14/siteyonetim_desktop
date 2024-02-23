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
    bool obscureText = false,
  }) : super(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            errorBorder: FormOutlineBorder(context.colorScheme.error),
            enabledBorder: FormOutlineBorder(context.colorScheme.primary),
            focusedBorder: FormOutlineBorder(context.colorScheme.secondary),
            focusedErrorBorder:
                FormOutlineBorder(context.colorScheme.errorContainer),
            disabledBorder: FormOutlineBorder(context.colorScheme.surface),
            border: FormOutlineBorder(Colors.black),
            contentPadding: ViewEnum.ennea.size.withPaddingAll,
          ),
        );
}
