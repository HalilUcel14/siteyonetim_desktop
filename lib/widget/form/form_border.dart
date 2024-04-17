import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';

final class FormOutlineBorder extends OutlineInputBorder {
  FormOutlineBorder(Color color)
      : super(
          gapPadding: SizeType.hexa.size,
          borderSide: BorderSide(
            color: color,
            strokeAlign: BorderSide.strokeAlignCenter,
            style: BorderStyle.solid,
            width: 2,
          ),
        );
}
