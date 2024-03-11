// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

mixin CustomerFormMixin on State<CustomerForm> {
  late BoolNotifier customerChoose;
  late TextEditingController customerName;
  late TextEditingController customerIdentityNo;
  late TextEditingController customerEmail;
  late TextEditingController customerPhone;
  late TextEditingController customerAddress;

  @override
  void initState() {
    super.initState();
    customerName = TextEditingController();
    customerIdentityNo = TextEditingController();
    customerEmail = TextEditingController();
    customerPhone = TextEditingController();
    customerAddress = TextEditingController();
    customerChoose = BoolNotifier(false);
    FormKeys.of.customerFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    customerChoose.dispose();
    customerName.dispose();
    customerIdentityNo.dispose();
    customerEmail.dispose();
    customerPhone.dispose();
    customerAddress.dispose();
    FormKeys.of.customerFormKey.currentState?.dispose();
    super.dispose();
  }

  CustomerModel? sendCustomerModel() {
    //
    if (FormKeys.of.customerFormKey.currentState == null) return null;
    if (!FormKeys.of.customerFormKey.currentState!.validate()) return null;
    //
    CustomerModel model;
    //
    if (customerChoose.value) {
      model = TBLCompany(
        uid: RandomKey.generate(),
        name: customerName.text,
        identityNo: customerIdentityNo.text,
        email: customerEmail.text,
        phone: customerPhone.text,
        address: customerAddress.text,
      );
    } else {
      model = TBLIndividual(
        uid: RandomKey.generate(),
        name: customerName.text,
        identityNo: customerIdentityNo.text,
        email: customerEmail.text,
        phone: customerPhone.text,
        address: customerAddress.text,
      );
    }

    return model;
  }

  ///
  ///
  String? textIdentitNo(String? text, String? label) {
    if (text.isNullOrEmpty) return '$label boş bırakılamaz.';
    // ------------------------------
    if (int.tryParse(text!) == null) return '$label tamsayı olmalıdır.';
    // ------------------------------
    if (!customerChoose.value) {
      if (text.isIndividualIdentity) return '$label 11 haneli olmalıdır.';
    } else {
      if (text.isCompanyIdentity) return '$label 11 veya 10 haneli olmalıdır.';
    }
    // ------------------------------
    if (int.parse(text) < 0) return '$label 0 dan büyük olmalıdır.';
    return null;
  }

  ///
  ///
  String? textNullableIdentitNo(String? text, String? label) {
    if (text.isNullOrEmpty) return null;
    // ------------------------------
    if (int.tryParse(text!) == null) return '$label tamsayı olmalıdır.';
    // ------------------------------
    if (!customerChoose.value) {
      if (text.isIndividualIdentity) return '$label 11 haneli olmalıdır.';
    } else {
      if (text.isCompanyIdentity) return '$label 11 veya 10 haneli olmalıdır.';
    }
    // ------------------------------
    if (int.parse(text) < 0) return '$label 0 dan büyük olmalıdır.';
    return null;
  }
}
    //
    // final TBLEvSahibi owner = TBLEvSahibi(
    //   uid: RandomKey.generate(),
    //   userUid: HiveBoxesObject.of.metaDB.meta?.user?.uid,
    //   customer: model,
    //   isActive: true,
    // );
    // //
    // final response = await HiveBoxesObject.of.evSahibiDB.addNewOwner(owner);
    // //
    // if (!context.mounted) return;
    // //
    // if (!response) {
    //   context.showSnackBar(
    //     const SnackBar(
    //       content: Text('Kayıt başarısız.'),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    //   return;
    // }
    // //
    // goToBack();