// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
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
  late String? roomType;
  late TBLOwner? ownerValue;
  late TBLTenant? tenantValue;
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
    roomType = '';
    isOwner = BoolNotifier(false);
    isTenant = BoolNotifier(false);
    ownerValue = null;
    tenantValue = null;
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
    //
    FormKeys.of.daireFormKey.currentState?.dispose();
    super.dispose();
  }

  void saveFormNewFlats() async {
    //
    if (FormKeys.of.daireFormKey.currentState == null) return;
    //
    if (!FormKeys.of.daireFormKey.currentState!.validate()) return;
    //
    final TBLFlats daire = TBLFlats(
      uid: RandomKey.generate(),
      userUid: context.metaDB.userUid,
      contractUid: null,
      subscriptionUid: null,
      apartmentUid: widget.apartment.uid,
      floor: int.parse(floor.text),
      flat: int.parse(flats.text),
      squareMeter: double.tryParse(squareM.text) ?? 0,
      netMeter: double.tryParse(netSquareM.text) ?? 0,
      roomType: roomType,
      isActive: true,
    );
    //
    //

    //
    if (daire.apartmentUid.isNullOrEmpty) {
      context.customShowDialog(
        dialog: CustomDialog(
          child: const CustomUserDialog.error(
            text: 'Apartman Verisi Seçilmedi',
          ),
        ),
      );
      return;
    }
    //
    if (daire < widget.apartment) {
      context.customShowDialog(
        dialog: CustomDialog(
          child: const CustomUserDialog.error(
            text: 'Daire Kat ve Kapı No su Apartman Kat ve Daire nosunu aşamaz',
          ),
        ),
      );
      return;
    }
    //
    final response = await HiveBoxesObject.of.flatsDB.create(daire);
    //
    if (response.hasError) {
      context.customShowDialog(
        dialog: CustomDialog(
          child: CustomUserDialog.error(
            text: response.message,
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
