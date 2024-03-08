import 'package:flutter/material.dart';

extension CoreWidgetExtension on Widget {
  AspectRatio aspectRatio(double ratio, {Key? key}) => AspectRatio(
        key: key,
        aspectRatio: ratio,
        child: this,
      );
}
