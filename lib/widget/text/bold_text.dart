import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class CBoldText extends Text {
  final TextType type;
  final StyleType styles;
  final String text;

  const CBoldText(
    this.text, {
    super.key,
    this.type = TextType.normal,
    this.styles = StyleType.bodyLarge,
    super.style,
    super.overflow,
    super.locale,
    super.maxLines,
    super.selectionColor,
    super.textAlign,
    super.textDirection,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.semanticsLabel,
    super.strutStyle,
    super.softWrap,
    super.textScaler,
  }) : super(text);

  @override
  Text build(BuildContext context) {
    return Text(
      text,
      key: key,
      maxLines: maxLines,
      locale: locale,
      overflow: overflow,
      style: style?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: styles.fontSize,
        letterSpacing: styles.letterSpacing,
        color: color(context),
      ),
      textAlign: textAlign,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      softWrap: softWrap,
      selectionColor: selectionColor,
      textScaler: textScaler,
    );
  }

  Color color(BuildContext context) {
    switch (type) {
      case TextType.normal:
        return context.colorScheme.onBackground;
      case TextType.primary:
        return context.colorScheme.onPrimary;
      case TextType.secondary:
        return context.colorScheme.onSecondary;
      case TextType.tertiary:
        return context.colorScheme.onTertiary;
      case TextType.error:
        return context.colorScheme.onError;
      case TextType.primaryContainer:
        return context.colorScheme.onPrimaryContainer;
      case TextType.secondaryContainer:
        return context.colorScheme.onSecondaryContainer;
      case TextType.tertiaryContainer:
        return context.colorScheme.onTertiaryContainer;
      case TextType.errorContainer:
        return context.colorScheme.onErrorContainer;

      default:
        return Colors.black;
    }
  }
}