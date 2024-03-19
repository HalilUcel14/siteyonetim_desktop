import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

class CustomFormView extends StatelessWidget {
  const CustomFormView({
    super.key,
    required this.formKey,
    required this.children,
  });

  final GlobalKey<FormState> formKey;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ColumnWithSpacing(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: SizeType.tetra.size,
        children: children,
      ),
    ).padding(pad: SizeType.hexa.size.withPaddingAll).scrollVertical();
  }
}
