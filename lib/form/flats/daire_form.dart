import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class DaireForm extends StatefulWidget {
  const DaireForm({super.key, required this.apartment});

  final TBLApartment apartment;

  @override
  State<DaireForm> createState() => _DaireFormState();
}

class _DaireFormState extends State<DaireForm>
    with DaireFormMixin, DaireValidatorMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKeys.of.daireFormKey,
      // --------------------------------
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          spacing: SizeType.hexa.size,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --------------------------------
            FormTitle(title: FormText.createDaire.text),
            // --------------------------------
            CustomTextFormField(
              controller: floor,
              decoration: floorDecoration(),
              forceField: true,
              validator: (value) => floorValidator(value),
            ),
            // --------------------------------
            CustomTextFormField(
              controller: flats,
              decoration: flatsDecoration(),
              forceField: true,
              validator: (value) => flatsValidator(value),
            ),
            // --------------------------------
            CustomTextFormField(
              controller: squareM,
              decoration: squareMDecoration(),
              validator: (value) => integerValidator(value),
            ),
            // --------------------------------
            CustomTextFormField(
              controller: netSquareM,
              decoration: netSquareMDecoration(),
              validator: (value) => integerValidator(value),
            ),
            // --------------------------------
            DropdownButtonFormField(
              decoration: CustomFormDecoration(
                context,
                labelText: FormText.daireRoom.text,
              ),
              items: RoomType.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.text)))
                  .toList(),
              onChanged: (value) => roomType = value.toString(),
              selectedItemBuilder: (context) => RoomType.values
                  .map((e) => Text(e.text))
                  .toList()
                  .cast<Widget>(),
            ),
            // --------------------------------
            RadioYesNoButton(
              notifier: isOwner,
              title: FormText.daireIsOwner.text,
            ),
            // --------------------------------
            ValueListenableBuilder(
              valueListenable: isOwner,
              builder: (context, value, child) {
                return CustomTextFormField(
                  controller: owner,
                  readOnly: true,
                  decoration: ownerDecoration(owner),
                  validator: (text) => value ? ownerValidator(text) : null,
                ).isVisibility(visible: value);
              },
            ),
            // --------------------------------
            RadioYesNoButton(
              notifier: isTenant,
              title: FormText.daireIsRented.text,
            ),
            // --------------------------------
            ValueListenableBuilder(
              valueListenable: isTenant,
              builder: (context, value, child) {
                return CustomTextFormField(
                  controller: tenant,
                  readOnly: true,
                  decoration: tenantDecoration(tenant),
                  validator: (text) => value ? tenantValidator(text) : null,
                ).isVisibility(visible: value);
              },
            ),
            // --------------------------------
            ElevatedButton(
              onPressed: () => saveFormNewFlats(),
              child: const Text('Kaydet'),
            ),
          ],
        ).padding(pad: SizeType.ennea.size.withPaddingAll),
      ),
    );
  }
}
