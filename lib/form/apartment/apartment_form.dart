import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:siteyonetim/index.dart';

class ApartmentForm extends StatefulWidget {
  const ApartmentForm({super.key});

  @override
  State<ApartmentForm> createState() => _ApartmentFormState();
}

class _ApartmentFormState extends State<ApartmentForm> with ApartmentFormMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormKeys.of.apartmentFormKey,
      // --------------------------------
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: SizeEnum.hexa.size,
          children: [
            // --------------------------------
            FormTitle(title: TableText.createApartman.text),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: name,
              labelText: TableText.apartmanName.text,
              validator: (value) => FormValidation.of.text(
                value,
                TableText.apartmanName.text,
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: address,
              labelText: TableText.apartmanAdres.text,
              validator: (value) => FormValidation.of.text(
                value,
                TableText.apartmanAdres.text,
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: floorCount,
              labelText: TableText.apartmanFloor.text,
              validator: (value) => FormValidation.of.intText(
                value,
                TableText.apartmanFloor.text,
              ),
            ),

            // --------------------------------
            CustomTextFormField(
              context,
              controller: flatsCount,
              labelText: TableText.apartmanFlats.text,
              validator: (value) => FormValidation.of.intText(
                value,
                TableText.apartmanFlats.text,
              ),
            ),
            // --------------------------------
            RadioYesNoButton(
              notifier: isElevator,
              title: TableText.isHaveElevator.text,
            ),

            // --------------------------------
            CustomTextFormField(
              context,
              controller: buildYear,
              labelText: TableText.apartmanYear.text,
              validator: (value) => FormValidation.of.dateText(
                value,
                TableText.apartmanYear.text,
              ),
              suffixIcon: IconButton(
                onPressed: () async => await pickBuildYear(context),
                icon: const Icon(Icons.calendar_month),
              ),
            ),
            // --------------------------------
            ElevatedButton(
              onPressed: () async => await formValidation(),
              child: Text(AppString.save.text),
            ),
          ],
        ).padding(pad: SizeEnum.ennea.size.withPaddingAll),
      ),
    );
  }
}
