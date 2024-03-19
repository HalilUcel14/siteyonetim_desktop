import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class KiraciForm extends StatefulWidget {
  const KiraciForm({super.key});

  @override
  State<KiraciForm> createState() => _KiraciFormState();
}

class _KiraciFormState extends State<KiraciForm> with KiraciFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKeys.of.kiraciFormKey,
      // --------------------------------
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          spacing: SizeType.hexa.size,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --------------------------------
            FormTitle(title: FormText.createTenant.text),
            // --------------------------------
            CustomerForm(key: customerKey),
            // --------------------------------
            ElevatedButton(
              onPressed: () => saveFormNewTenant(),
              child: const Text('Kaydet'),
            ),
            // --------------------------------
          ],
        ).padding(pad: SizeType.ennea.size.withPaddingAll),
      ),
    );
  }
}
