import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class PrimaryCard extends Card {
  const PrimaryCard({
    super.key,
    super.child,
    super.shadowColor,
    super.elevation,
    super.shape,
    super.borderOnForeground,
    super.margin,
    super.clipBehavior,
    super.semanticContainer,
    super.surfaceTintColor,
  }) : super();

  @override
  Card build(BuildContext context) {
    return Card(
      key: key,
      color: context.colorScheme.primaryContainer,
      shape: shape,
      clipBehavior: clipBehavior,
      margin: margin,
      semanticContainer: semanticContainer,
      borderOnForeground: borderOnForeground,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      elevation: elevation,
      child: child,
    );
  }
}
