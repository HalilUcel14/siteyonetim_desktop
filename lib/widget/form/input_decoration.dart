import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

class CustomFormDecoration extends InputDecoration {
  CustomFormDecoration(
    BuildContext context, {
    super.labelText,
    super.hintText,
    super.prefixIcon,
    super.suffixIcon,
  }) : super(
          errorBorder: FormOutlineBorder(context.colorScheme.error),
          enabledBorder: FormOutlineBorder(context.colorScheme.primary),
          focusedBorder: FormOutlineBorder(context.colorScheme.secondary),
          focusedErrorBorder: FormOutlineBorder(
            context.colorScheme.errorContainer,
          ),
          disabledBorder: FormOutlineBorder(context.colorScheme.surface),
          border: FormOutlineBorder(Colors.black),
          contentPadding: SizeType.ennea.size.withPaddingAll,
        );
}
