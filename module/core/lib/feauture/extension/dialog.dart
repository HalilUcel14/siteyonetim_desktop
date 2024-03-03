import 'package:flutter/material.dart';

extension CustomShowDialog on BuildContext {
  Future<T?> customShowDialog<T>(Widget child, {Key? key}) async {
    return await showDialog<T>(
      context: this,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 8,
          backgroundColor: Colors.transparent,
          alignment: Alignment.center,
          insetAnimationCurve: Curves.elasticInOut,
          insetAnimationDuration: const Duration(milliseconds: 200),
          insetPadding: const EdgeInsets.all(16),
          shadowColor: Colors.black54,
          surfaceTintColor: Colors.red,
          clipBehavior: Clip.antiAlias,
          key: key,
          child: child,
        );
      },
    );
  }
}
