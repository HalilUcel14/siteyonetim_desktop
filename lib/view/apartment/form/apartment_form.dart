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
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: SizeEnum.hexa.size,
          children: [
            // --------------------------------
            const Text(
              'Yeni Apartman Oluştur.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // --------------------------------
            const Divider(),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: name,
              labelText: 'Apartman İsmi',
              validator: (value) => FormValidation.of.text(
                value,
                'Apartman İsmi',
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: address,
              labelText: 'Apartman Adresi',
              validator: (value) => FormValidation.of.text(
                value,
                'Apartman Adresi',
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: floorCount,
              labelText: 'Apartman Kat Sayısı',
              validator: (value) => FormValidation.of.intText(
                value,
                'Kat Sayısı',
              ),
            ),

            // --------------------------------
            CustomTextFormField(
              context,
              controller: flatsCount,
              labelText: 'Apartman Daire Sayısı',
              validator: (value) => FormValidation.of.intText(
                value,
                'Daire Sayısı',
              ),
            ),
            // --------------------------------
            RadioYesNoButton(
              notifier: isElevator,
              title: 'Apartman İçerisinde Asansör Var mı?',
            ),

            // --------------------------------
            CustomTextFormField(
              context,
              controller: buildYear,
              labelText: 'Apartman Yapım Yılı',
              validator: (value) => FormValidation.of.dateText(
                value,
                'Yapım Yılı',
              ),
              suffixIcon: IconButton(
                onPressed: () async => await pickBuildYear(context),
                icon: const Icon(Icons.calendar_month),
              ),
            ),
            // --------------------------------
            RowWithSpacing(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: SizeEnum.ennea.size,
              children: [
                ElevatedButton(
                  onPressed: () => goToBack(),
                  child: Text(AppString.close.text),
                ),
                ElevatedButton(
                  onPressed: () async => await formValidation(),
                  child: Text(AppString.save.text),
                ),
              ],
            ),
          ],
        ).padding(pad: SizeEnum.ennea.size.withPaddingAll),
      ),
    );
  }
}
