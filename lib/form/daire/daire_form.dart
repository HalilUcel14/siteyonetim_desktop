import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class DaireForm extends StatefulWidget {
  const DaireForm({super.key, this.apartment});

  final TBLApartment? apartment;

  @override
  State<DaireForm> createState() => _DaireFormState();
}

class _DaireFormState extends State<DaireForm> with DaireFormMixin {
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
              // labelText: FormText.daireFloor.text,
              // validator: (value) => FormValidation.of.intText(
              //   value,
              //   FormText.daireFloor.text,
              // ),
            ),
            // --------------------------------
            CustomTextFormField(
              controller: flats,
              // labelText: FormText.daireNumber.text,
              // validator: (value) => FormValidation.of.intText(
              //   value,
              //   FormText.daireNumber.text,
              // ),
            ),
            // --------------------------------
            CustomTextFormField(
              controller: squareM,
              // labelText: FormText.daireSquare.text,
              // validator: (value) => FormValidation.of.intNullableText(
              //   value,
              //   FormText.daireSquare.text,
              // ),
            ),
            // --------------------------------
            CustomTextFormField(
              controller: netSquareM,
              // labelText: FormText.daireNetSquare.text,
              // validator: (value) => FormValidation.of.intNullableText(
              //   value,
              //   FormText.daireNetSquare.text,
              // ),
            ),
            // --------------------------------
            CustomTextFormField(
              controller: room,
              // labelText: FormText.daireRoom.text,
              // validator: (value) => FormValidation.of.intNullableText(
              //   value,
              //   FormText.daireRoom.text,
              // ),
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
                  // labelText: FormText.daireOwner.text,
                  // suffixIcon: IconButton(
                  //   onPressed: () => submitOwnerFlats(),
                  //   icon: const Icon(Icons.view_list_rounded),
                  // ),
                  // validator: (text) => value
                  //     ? FormValidation.of.text(text, FormText.daireOwner.text)
                  //     : null,
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
                  // labelText: FormText.daireTenant.text,
                  // suffixIcon: IconButton(
                  //   onPressed: () => submitTenantFlats(),
                  //   icon: const Icon(Icons.view_list_rounded),
                  // ),
                  // validator: (text) => value
                  //     ? FormValidation.of.text(text, FormText.daireTenant.text)
                  //     : null,
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
