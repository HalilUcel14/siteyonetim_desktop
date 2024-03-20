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
    CustomFormDecoration? decoration,
    bool forceField = false,
    int minimumValueLenght = 0,
  }) : super(
          obscureText: obscureText,
          decoration: decoration,
          validator: (value) {
            if (forceField || minimumValueLenght > 0) {
              if (value.isNullOrEmpty) return 'Bu alan boş bırakılamaz';
              if (value!.length < minimumValueLenght) {
                return 'Bu alan en az $minimumValueLenght karakter olmalıdır';
              }
            }

            //--------------------------------
            validator?.call(value);
            return null;
            //--------------------------------
          },
        );
}
