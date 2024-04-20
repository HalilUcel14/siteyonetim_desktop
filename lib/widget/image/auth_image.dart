import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class AuhtImage extends StatelessWidget {
  const AuhtImage({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return WImageAsset(
          path: path,
          size: constraint.maxWidth * WPercent.pSixty.size,
        );
      },
    );
  }
}
