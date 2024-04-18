import 'package:codeofland/codeofland.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';
import 'package:siteyonetim/widget/index.dart';

class CustomSnackbar {
  BuildContext context;

  CustomSnackbar(this.context);

  void showSuccess({required String message}) {
    if (!context.mounted) return;
    // --------------------------------
    context.showSnackBar(
      SafetySnackbar(type: MessageType.success, message: message),
    );
    return;
  }

  void showError({required String message}) {
    if (!context.mounted) return;
    // --------------------------------
    context.showSnackBar(
      SafetySnackbar(type: MessageType.error, message: message),
    );
    return;
  }

  void showInfo({required String message}) {
    if (!context.mounted) return;
    // --------------------------------
    context.showSnackBar(
      SafetySnackbar(type: MessageType.info, message: message),
    );
    return;
  }
}
