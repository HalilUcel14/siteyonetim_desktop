// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin ApartmentFormMixin on State<ApartmentForm> {
  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController floorCount;
  late TextEditingController flatsCount;
  late TextEditingController buildYear;
  late BoolNotifier isElevator;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    address = TextEditingController();
    floorCount = TextEditingController();
    flatsCount = TextEditingController();
    buildYear = TextEditingController();
    isElevator = BoolNotifier(false);
    FormKeys.of.apartmentFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    address.dispose();
    floorCount.dispose();
    flatsCount.dispose();
    buildYear.dispose();
    isElevator.dispose();
    FormKeys.of.apartmentFormKey.currentState?.dispose();
  }

  Future<void> formValidation() async {
    if (FormKeys.of.apartmentFormKey.currentState == null) return;
    if (!FormKeys.of.apartmentFormKey.currentState!.validate()) return;
    //
    final String? userUid = HiveBoxesObject.of.metaDB.meta?.user?.uid;
    //
    if (!context.mounted) return;
    //
    if (userUid == null) {
      context.showSnackBar(
        const SnackBar(content: Text('Kullanıcı Bulunamadı')),
      );
      return;
    }
    //
    final response = await HiveBoxesObject.of.apartmentDB.createNewApartment(
      name.text.trim(),
      userUid,
      address.text.trim(),
      int.parse(floorCount.text.trim()),
      int.parse(flatsCount.text.trim()),
      DateTime.parse(buildYear.text.trim()),
      isElevator.value,
      true, // 'İsActive
    );
    //
    if (!response) {
      context.showSnackBar(
        const SnackBar(content: Text('Apartman Oluşturulamadı')),
      );
      return;
    }
    //
    goToBack();
  }

  void goToBack() {
    if (context.canPop()) return context.pop();
  }

  Future<void> pickBuildYear(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      String day = picked.day.toString().padLeft(2, '0');
      String month = picked.month.toString().padLeft(2, '0');
      String year = picked.year.toString();
      buildYear.text = '$year-$month-$day';
    }
    return;
  }
}
