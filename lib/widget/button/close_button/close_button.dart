import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      icon: const Icon(
        Icons.close,
        size: 24,
        color: Colors.white,
      ),
      onPressed: () => Navigator.of(context).pop(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          context.colorScheme.error,
        ),
        alignment: Alignment.center,
      ),
    ).withSizedBox(height: 36, width: 36);
  }
}
