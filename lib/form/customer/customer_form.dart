import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({Key? key}) : super(key: key);

  @override
  State<CustomerForm> createState() => CustomerFormState();
}

class CustomerFormState extends State<CustomerForm> with CustomerFormMixin {
  @override
  Widget build(BuildContext context) {
    // --------------------------------
    return Form(
      key: FormKeys.of.customerFormKey,
      // --------------------------------
      child: SingleChildScrollView(
        child: ColumnWithSpacing(
          spacing: SizeEnum.hexa.size,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --------------------------------
            RadioYesNoButton(
              notifier: customerChoose,
              title: 'Müşteri Bir Firma mı?',
            ),
            // --------------------------------
            ValueListenableBuilder(
              valueListenable: customerChoose,
              builder: (context, value, child) {
                return CustomTextFormField(
                  context,
                  controller: customerName,
                  labelText: value
                      ? TableText.companyName.text
                      : TableText.individualName.text,
                  validator: (text) => FormValidation.of.text(
                    text,
                    value
                        ? TableText.companyName.text
                        : TableText.individualName.text,
                  ),
                );
              },
            ),
            // --------------------------------
            ValueListenableBuilder(
              valueListenable: customerChoose,
              builder: (context, value, child) {
                return CustomTextFormField(
                  context,
                  controller: customerIdentityNo,
                  labelText: value
                      ? TableText.companyIdentityNo.text
                      : TableText.individualIndentityNo.text,
                  validator: (text) => textNullableIdentitNo(
                    text,
                    value
                        ? TableText.companyIdentityNo.text
                        : TableText.individualIndentityNo.text,
                  ),
                );
              },
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: customerEmail,
              labelText: TableText.customerEmail.text,
              validator: (text) => FormValidation.of.emailNullableText(
                text,
                TableText.customerEmail.text,
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: customerPhone,
              labelText: TableText.customerPhone.text,
              validator: (text) => FormValidation.of.phoneNullableText(
                text,
                TableText.customerPhone.text,
              ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: customerAddress,
              labelText: TableText.customerAdres.text,
              validator: (text) => FormValidation.of.textNullable(
                text,
                TableText.customerAdres.text,
              ),
            ),
            // --------------------------------
          ],
        ),
      ),
    );
  }
}
