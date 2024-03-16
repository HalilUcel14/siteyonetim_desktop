import 'package:app_hive/app_hive.dart';
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
          spacing: SizeEnum.hexa.size,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --------------------------------
            FormTitle(title: TableText.createTenant.text),
            // --------------------------------
            CustomerForm(key: customerKey),
            // --------------------------------
            ElevatedButton(
              onPressed: () => saveFormNewTenant(),
              child: const Text('Kaydet'),
            ),
            // --------------------------------
          ],
        ).padding(pad: SizeEnum.ennea.size.withPaddingAll),
      ),
    );
  }
}
