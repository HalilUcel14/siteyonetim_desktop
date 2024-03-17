import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class FormViewDialog extends StatelessWidget {
  const FormViewDialog({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              borderRadius: SizeEnum.hexa.size.radiusCircle,
            ),
            child: child,
          ),
          _closeButton(context),
        ],
      ),
    );
  }

  Positioned _closeButton(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: CloseButton(
        color: Colors.white,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            context.colorScheme.errorContainer,
          ),
        ),
      ),
    );
  }
}
