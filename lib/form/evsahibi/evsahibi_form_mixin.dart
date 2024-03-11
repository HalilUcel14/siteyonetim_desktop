import 'package:app_hive/app_hive.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

mixin EvSahibiFormMixin on State<EvSahibiForm> {
  late GlobalKey<CustomerFormState> customerKey;

  @override
  void initState() {
    super.initState();
    customerKey = GlobalKey();
    FormKeys.of.evSahibiFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    customerKey.currentState?.dispose();
    FormKeys.of.evSahibiFormKey.currentState?.dispose();
    super.dispose();
  }

  void saveFormNewOwner() {
    if (FormKeys.of.customerFormKey.currentState == null) return;
    if (!FormKeys.of.customerFormKey.currentState!.validate()) return;
    //
    CustomerModel? customer = customerKey.currentState?.sendCustomerModel();
    //
    if (!context.mounted) return;
    if (customer == null) {
      context.customShowDialog(
        const CustomUserDialog.error(
          text: 'Müşteri Verileri Girilmedi',
        ),
      );
    } else {
      context.customShowDialog(
        const CustomUserDialog.success(
          text: 'Müşteri Verileri Kaydedildi',
        ),
      );
    }
  }
}
