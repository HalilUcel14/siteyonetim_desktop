import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

final class CircleIconDecoration extends BoxDecoration {
  CircleIconDecoration(BuildContext context)
      : super(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.themeData.shadowColor,
              offset: const Offset(0, 0),
              blurRadius: 15,
            ),
          ],
        );
}
