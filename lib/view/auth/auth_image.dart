import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class AuhtImage extends StatelessWidget {
  const AuhtImage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return WIconAsset(
          path: MyAsset.sign.iconPng,
          size: constraint.maxWidth * .8,
        );
      },
    );
  }
}
