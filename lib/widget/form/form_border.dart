import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

final class FormOutlineBorder extends OutlineInputBorder {
  FormOutlineBorder(Color color)
      : super(
          borderRadius: SizeType.tetra.size.radiusCircle,
          gapPadding: SizeType.hexa.size,
          borderSide: BorderSide(
            color: color,
            strokeAlign: BorderSide.strokeAlignCenter,
            style: BorderStyle.solid,
            width: 2,
          ),
        );
}
