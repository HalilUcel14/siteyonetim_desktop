import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

final class FormOutlineBorder extends OutlineInputBorder {
  FormOutlineBorder(Color color)
      : super(
          borderRadius: ViewEnum.tetra.size.radiusCircle,
          gapPadding: ViewEnum.hexa.size,
          borderSide: BorderSide(
            color: color,
            strokeAlign: BorderSide.strokeAlignCenter,
            style: BorderStyle.solid,
            width: 4,
          ),
        );
}
