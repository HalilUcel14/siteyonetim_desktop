import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin DetailDialogMixin on State<DetailDialogs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  BoxConstraints get boxConstraints => const BoxConstraints(
        maxWidth: 300,
        minHeight: 150,
        minWidth: 300,
        maxHeight: 200,
      );

  BoxDecoration get decoration => BoxDecoration(
        color: containerColor(widget.type),
        borderRadius: SizeType.hexa.size.radiusCircle,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      );

  Color containerColor(DialogType type) {
    switch (type) {
      case DialogType.success:
        return context.colorScheme.primaryContainer;
      case DialogType.error:
        return context.colorScheme.errorContainer;
      case DialogType.warning:
        return context.colorScheme.tertiaryContainer;
      case DialogType.info:
        return context.colorScheme.secondaryContainer;
    }
  }

  IconData get icon {
    switch (widget.type) {
      case DialogType.success:
        return Icons.check_circle;
      case DialogType.error:
        return Icons.error;
      case DialogType.warning:
        return Icons.warning;
      case DialogType.info:
        return Icons.info;
    }
  }

  Color get iconColor => context.colorScheme.tertiaryContainer;

  Color get iconDataColor => context.colorScheme.primary;
}
