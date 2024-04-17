import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

@immutable
final class SplashBoxDecoration extends BoxDecoration {
  SplashBoxDecoration(BuildContext context)
      : super(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.onPrimaryContainer,
              context.colorScheme.onPrimaryContainer,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        );
}
