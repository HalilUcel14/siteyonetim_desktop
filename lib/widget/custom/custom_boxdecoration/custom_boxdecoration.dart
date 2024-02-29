import 'package:flutter/material.dart';

class MyBoxDecoration extends BoxDecoration {
  MyBoxDecoration({
    Color? color,
    Gradient? gradient,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
  }) : super(
          color: color ?? Colors.transparent,
          gradient: gradient,
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          boxShadow: boxShadow ?? const [],
        );
}
