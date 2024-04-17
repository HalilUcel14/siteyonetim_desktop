import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  BuildContext context;

  CustomSnackbar(this.context);

  void showSuccess({required String message}) {
    if (!context.mounted) return;
    // --------------------------------
    context.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SnackBarView(type: MessageType.success, message: message),
      ),
    );
    return;
  }

  void showError({required String message}) {
    if (!context.mounted) return;
    // --------------------------------
    context.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SnackBarView(type: MessageType.error, message: message),
      ),
    );
    return;
  }

  void showInfo({required String message}) {
    if (!context.mounted) return;
    // --------------------------------
    context.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SnackBarView(type: MessageType.info, message: message),
      ),
    );
    return;
  }
}

enum MessageType { success, error, warning, info }

class SnackBarView extends StatelessWidget {
  const SnackBarView({super.key, required this.type, required this.message});

  final MessageType type;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SizeType.ennea.size.withPaddingAll,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(SizeType.ennea.size),
        border: Border.all(
          color: context.colorScheme.onSurface,
          width: 4,
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: SizeType.zeta.size,
        maxHeight: SizeType.hepta.size,
      ),
      child: RowWithSpacing(
        spacing: SizeType.ennea.size,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            getIcon(type),
            size: SizeType.mega.size,
            color: getIconColor(type, context),
          ),
          WBoldText(
            text: message,
            wStyle: WTextStyle.titleMedium,
            wColor: WColor.onPrimaryContainer,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
            maxLines: 3,
          ).expanded(),
        ],
      ),
    ).center();
  }

  IconData getIcon(MessageType type) {
    switch (type) {
      case MessageType.success:
        return Icons.check_circle;
      case MessageType.error:
        return Icons.error;
      case MessageType.warning:
        return Icons.warning;
      case MessageType.info:
        return Icons.info;
    }
  }

  Color getIconColor(MessageType type, BuildContext context) {
    switch (type) {
      case MessageType.success:
        return context.colorScheme.primaryContainer;
      case MessageType.error:
        return context.colorScheme.errorContainer;
      case MessageType.warning:
        return context.colorScheme.tertiaryContainer;
      case MessageType.info:
        return context.colorScheme.secondaryContainer;
    }
  }
}
