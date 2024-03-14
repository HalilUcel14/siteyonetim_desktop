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
  late TBLEvSahibi? ownerValue;
  late TBLKiraci? tenantValue;
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

    FormKeys.of.daireFormKey.currentState?.dispose();
    super.dispose();
  }

  void saveFormNewFlats() async {
    //
    if (FormKeys.of.daireFormKey.currentState == null) return;
    //
    if (!FormKeys.of.daireFormKey.currentState!.validate()) return;
    //
    final TBLDaire daire = TBLDaire(
      uid: RandomKey.generate(),
      apartmentUid: widget.apartment?.uid,
      floor: int.parse(floor.text),
      flats: int.parse(flats.text),
      squareMeter: int.tryParse(squareM.text) ?? 0,
      netSquareMeter: int.tryParse(netSquareM.text) ?? 0,
      roomCount: int.tryParse(room.text) ?? 0,
      owner: ownerValue,
      tenant: tenantValue,
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
    if (daire < widget.apartment!) {
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
    final response = await HiveBoxesObject.of.daireDB.addNewDaire(daire);
    //
    if (!context.mounted) return;
    if (!response) {
      context.customShowDialog(
        dialog: CustomDialog(
          child: const CustomUserDialog.error(
            text: 'Daire Eklenemedi',
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

  void submitOwnerFlats() async {
    //
    ownerValue = await context.customShowDialog<TBLEvSahibi>(
      dialog: CustomDialog(
        child: const FormViewDialog(
          child: EvSahibiList(),
        ),
      ),
    );
    //
    if (ownerValue == null) return;
    //
    if (ownerValue!.customer == null) return;
    //
    owner.text = ownerValue!.customer!.name ?? '';
  }

  void submitTenantFlats() async {
    //
    tenantValue = await context.customShowDialog<TBLKiraci>(
      dialog: CustomDialog(
        child: const FormViewDialog(
          child: KiraciList(),
        ),
      ),
    );
    //
    if (tenantValue == null) return;
    //
    if (tenantValue!.customer == null) return;
    //
    tenant.text = tenantValue!.customer!.name ?? '';
  }
}
