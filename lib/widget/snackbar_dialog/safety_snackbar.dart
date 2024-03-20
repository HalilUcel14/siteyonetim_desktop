import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  BuildContext context;

  CustomSnackbar(this.context);

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
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(SizeType.ennea.size),
      ),
      constraints: BoxConstraints(
        maxWidth: SizeType.zeta.size,
        maxHeight: SizeType.teta.size,
      ),
      child: RowWithSpacing(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            getIcon(MessageType.success),
            size: SizeType.hepta.size,
          ),
          WBoldText(
            message,
            wStyle: WTextStyle.headlineSmall,
            wColor: WTextColor.onPrimaryContainer,
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
}
