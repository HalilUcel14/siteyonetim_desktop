import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
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
                      ? FormText.companyName.text
                      : FormText.individualName.text,
                  // validator: (text) => FormValidation.of.text(
                  //   text,
                  //   value
                  //       ? FormText.companyName.text
                  //       : FormText.individualName.text,
                  // ),
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
                      ? FormText.companyIdentityNo.text
                      : FormText.individualIndentityNo.text,
                  validator: (text) => textNullableIdentitNo(
                    text,
                    value
                        ? FormText.companyIdentityNo.text
                        : FormText.individualIndentityNo.text,
                  ),
                );
              },
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: customerEmail,
              labelText: FormText.customerEmail.text,
              // validator: (text) => FormValidation.of.emailNullableText(
              //   text,
              //   FormText.customerEmail.text,
              // ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: customerPhone,
              labelText: FormText.customerPhone.text,
              // validator: (text) => FormValidation.of.phoneNullableText(
              //   text,
              //   FormText.customerPhone.text,
              // ),
            ),
            // --------------------------------
            CustomTextFormField(
              context,
              controller: customerAddress,
              labelText: FormText.customerAdres.text,
              // validator: (text) => FormValidation.of.textNullable(
              //   text,
              //   FormText.customerAdres.text,
              // ),
            ),
            // --------------------------------
          ],
        ),
      ),
    );
  }
}
