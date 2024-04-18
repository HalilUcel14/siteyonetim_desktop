import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

@immutable
final class SplashBoxDecoration extends BoxDecoration {
  SplashBoxDecoration(BuildContext context)
      : super(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.secondary,
              context.colorScheme.tertiary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        );
}
