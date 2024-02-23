import 'package:flutter/material.dart';

class TwoDemantionalScroll extends StatelessWidget {
  const TwoDemantionalScroll({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: child,
      ),
    );
  }
}
