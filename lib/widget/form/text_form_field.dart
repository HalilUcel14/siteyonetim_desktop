import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

final class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    super.key,
    super.readOnly,
    super.controller,
    String? Function(String?)? validator,
    bool obscureText = false,
    bool forceField = false,
    CustomFormDecoration? decoration,
  }) : super(
          obscureText: obscureText,
          decoration: decoration,
          validator: (value) {
            if (forceField) {
              return value.isNullOrEmpty ? 'Bu alan boş bırakılamaz' : null;
            }
            //--------------------------------
            validator?.call(value);
            return null;
            //--------------------------------
          },
        );
}
