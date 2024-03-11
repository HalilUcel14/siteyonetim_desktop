// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

mixin KiraciFormMixin on State<KiraciForm> {
  late GlobalKey<CustomerFormState> customerKey;

  @override
  void initState() {
    super.initState();
    customerKey = GlobalKey();
    FormKeys.of.kiraciFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    customerKey.currentState?.dispose();
    FormKeys.of.kiraciFormKey.currentState?.dispose();
    super.dispose();
  }

  void saveFormNewTenant() async {
    if (FormKeys.of.customerFormKey.currentState == null) return;
    if (!FormKeys.of.customerFormKey.currentState!.validate()) return;
    //
    CustomerModel? customer = customerKey.currentState?.sendCustomerModel();
    //
    //
    if (!context.mounted) return;
    if (customer == null) {
      context.customShowDialog(
        const CustomUserDialog.error(
          text: 'Müşteri Verileri Girilmedi',
        ),
      );
      return;
    }

    //
    TBLKiraci tenant = TBLKiraci(
      uid: RandomKey.generate(),
      userUid: HiveBoxesObject.of.metaDB.userUid,
      customer: customer,
      isActive: true,
    );
    //
    final bool response =
        await HiveBoxesObject.of.kiraciDB.addNewTenant(tenant);
    //
    if (!context.mounted) return;
    if (!response) {
      context.customShowDialog(
        const CustomUserDialog.error(
          text: 'Kiracı Eklenemedi',
        ),
      );
      return;
    }
    //
    goToBack();
  }

  void goToBack() {
    Navigator.of(context).pop();
  }
}
