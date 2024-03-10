import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

mixin DaireFormMixin on State<DaireForm> {
  late TextEditingController floor;
  late TextEditingController flats;
  late TextEditingController squareM;
  late TextEditingController netSquareM;
  late TextEditingController room;
  late TextEditingController owner;
  late TextEditingController tenant;
  late BoolNotifier isOwner;
  late BoolNotifier isTenant;

  @override
  void initState() {
    FormKeys.of.daireFormKey = GlobalKey<FormState>();
    floor = TextEditingController();
    flats = TextEditingController();
    squareM = TextEditingController();
    netSquareM = TextEditingController();
    room = TextEditingController();
    owner = TextEditingController();
    tenant = TextEditingController();
    isOwner = BoolNotifier(false);
    isTenant = BoolNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    floor.dispose();
    flats.dispose();
    squareM.dispose();
    netSquareM.dispose();
    room.dispose();
    owner.dispose();
    tenant.dispose();
    isOwner.dispose();
    isTenant.dispose();
    FormKeys.of.daireFormKey.currentState?.dispose();
    super.dispose();
  }

  void saveFormNewFlats() {
    //
    if (FormKeys.of.daireFormKey.currentState == null) return;
    //
    if (!FormKeys.of.daireFormKey.currentState!.validate()) return;
    //
  }

  void submitOwnerFlats() {
    //
    context.customShowDialog(
      const FormViewDialog(
        child: EvSahibiList(),
      ),
    );
  }
}
