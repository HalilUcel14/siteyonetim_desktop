import 'package:flutter/material.dart';

extension ScrollWidgetExtension on Widget {
  SingleChildScrollView get horizontalScrollView => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: this,
      );

  SingleChildScrollView get verticalScrollView => SingleChildScrollView(
        child: this,
      );
}
