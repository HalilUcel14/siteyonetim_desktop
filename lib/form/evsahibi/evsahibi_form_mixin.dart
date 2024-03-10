import 'package:flutter/material.dart';

import '../../index.dart';

mixin EvSahibiFormMixin on State<EvSahibiForm> {
  @override
  void initState() {
    super.initState();
    FormKeys.of.evSahibiFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    FormKeys.of.evSahibiFormKey.currentState?.dispose();
    super.dispose();
  }

  void saveFormNewOwner() {
    if (FormKeys.of.evSahibiFormKey.currentState == null) return;
    if (!FormKeys.of.evSahibiFormKey.currentState!.validate()) return;
    //
    if (FormKeys.of.customerFormKey.currentState == null) return;
    if (!FormKeys.of.customerFormKey.currentState!.validate()) return;
    //
  }
}
