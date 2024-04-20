import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class LineContainer extends Container {
  LineContainer(BuildContext context, {super.key})
      : super(
          width: SizeType.deca.size,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.colorScheme.onSurface,
                width: 1,
              ),
            ),
          ),
        );
}
