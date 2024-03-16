import 'package:app_hive/app_hive.dart';
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
          spacing: SizeEnum.hexa.size,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --------------------------------
            FormTitle(title: TableText.createOwner.text),
            // --------------------------------
            CustomerForm(key: customerKey),
            // --------------------------------
            ElevatedButton(
              onPressed: () => saveFormNewOwner(),
              child: const Text('Kaydet'),
            ),
            // --------------------------------
          ],
        ).padding(pad: SizeEnum.ennea.size.withPaddingAll),
      ),
    );
  }
}
