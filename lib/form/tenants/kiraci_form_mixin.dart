// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:app_hive/index.dart';
import 'package:codeofland/other/random_key/random_key.dart';
import 'package:codeofwidget/codeofwidget.dart';
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
    TBLCustomer? customer = customerKey.currentState?.sendCustomerModel();
    //
    //
    if (!context.mounted) return;
    if (customer == null) {
      context.customShowDialog(
        dialog: CustomDialog(
          child: const CustomUserDialog.error(
            text: 'Müşteri Verileri Girilmedi',
          ),
        ),
      );
      return;
    }

    //
    TBLTenant tenant = TBLTenant(
      uid: RandomKey.generate(),
      userUid: HiveBoxesObject.of.metaDB.userUid,
      customer: customer,
      isActive: true,
    );
    //
    final bool response =
        await HiveBoxesObject.of.tenantDB.addNewTenant(tenant);
    //
    if (!context.mounted) return;
    if (!response) {
      context.customShowDialog(
        dialog: CustomDialog(
          child: const CustomUserDialog.error(
            text: 'Kiracı Eklenemedi',
          ),
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
