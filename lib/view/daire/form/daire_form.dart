import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

class DaireForm extends StatefulWidget {
  const DaireForm({super.key});

  @override
  State<DaireForm> createState() => _DaireFormState();
}

class _DaireFormState extends State<DaireForm> with DaireFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKeys.of.daireFormKey,
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          spacing: SizeEnum.ennea.size,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --------------------------------
            Text(
              TableText.createApartman.text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // --------------------------------
            const Divider(),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: floor,
              labelText: TableText.daireFloor.text,
              validator: (value) => FormValidation.of.intText(
                value,
                TableText.daireFloor.text,
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: flats,
              labelText: TableText.daireNumber.text,
              validator: (value) => FormValidation.of.intText(
                value,
                TableText.daireNumber.text,
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: squareM,
              labelText: TableText.daireSquare.text,
              validator: (value) => FormValidation.of.intText(
                value,
                TableText.daireSquare.text,
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: netSquareM,
              labelText: TableText.daireNetSquare.text,
              validator: (value) => FormValidation.of.intText(
                value,
                TableText.daireNetSquare.text,
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: room,
              labelText: TableText.daireRoom.text,
              validator: (value) => FormValidation.of.intText(
                value,
                TableText.daireRoom.text,
              ),
            ),
            // --------------------------------
            RadioYesNoButton(
              notifier: isOwner,
              title: TableText.daireIsOwner.text,
            ),
            // --------------------------------
            ValueListenableBuilder(
              valueListenable: isOwner,
              builder: (context, value, child) {
                return CustomTextFormField(
                  context,
                  controller: owner,
                  labelText: TableText.daireOwner.text,
                  suffixIcon: IconButton(
                    onPressed: () => submitOwnerFlats(),
                    icon: const Icon(Icons.view_list_rounded),
                  ),
                ).isVisibility(visible: value);
              },
            ),
            // --------------------------------
            RadioYesNoButton(
              notifier: isTenant,
              title: TableText.daireIsRented.text,
            ),
            // --------------------------------
            ValueListenableBuilder(
              valueListenable: isTenant,
              builder: (context, value, child) {
                return CustomTextFormField(
                  context,
                  controller: tenant,
                  labelText: TableText.daireTenant.text,
                ).isVisibility(visible: value);
              },
            ),
          ],
        ).padding(pad: SizeEnum.ennea.size.withPaddingAll),
      ),
    );
  }
}
