import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class EvSahibiForm extends StatefulWidget {
  const EvSahibiForm({super.key});

  @override
  State<EvSahibiForm> createState() => _EvSahibiFormState();
}

class _EvSahibiFormState extends State<EvSahibiForm> with EvSahibiFormMixin {
  @override
  Widget build(BuildContext context) {
    // --------------------------------
    return Form(
      key: FormKeys.of.evSahibiFormKey,
      // --------------------------------
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          spacing: SizeType.hexa.size,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --------------------------------
            FormTitle(title: FormText.createOwner.text),
            // --------------------------------
            CustomerForm(key: customerKey),
            // --------------------------------
            ElevatedButton(
              onPressed: () => saveFormNewOwner(),
              child: const Text('Kaydet'),
            ),
            // --------------------------------
          ],
        ).padding(pad: SizeType.ennea.size.withPaddingAll),
      ),
    );
  }
}
