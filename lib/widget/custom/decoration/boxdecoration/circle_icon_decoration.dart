import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

final class CircleIconDecoration extends BoxDecoration {
  CircleIconDecoration(BuildContext context)
      : super(
          color: context.colorScheme.onPrimary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.themeData.shadowColor,
              offset: const Offset(-5, 5),
              blurRadius: 10,
              blurStyle: BlurStyle.solid,
            ),
          ],
        );
}
