// ignore_for_file: use_build_context_synchronously

import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

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
    if (!FormKeys.of.apartmentFormKey.safetyValidate()) return;
    //
    final String? userUid = HiveBoxesObject.of.metaDB.userUid;
    //
    if (userUid == null) {
      CustomSnackbar(context)
          .showError(message: FormError.notFindActiveUser.text);
      return;
    }
    //
    final response = await DBApartment.of.create(
      name: name.text.trim(),
      address: address.text.trim(),
      floorCount: int.parse(floorCount.text.trim()),
      flatsCount: int.parse(flatsCount.text.trim()),
      buildYear: DateTime.parse(buildYear.text.trim()),
      haveElevator: isElevator.value,
    );
    // TODO: Response Kontrolü yapılacak
    if (!response.hasError) {
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

  Future<void> pickBuildYear() async {
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

  IconButton buildYearIcon() {
    return IconButton(
      onPressed: () async => await pickBuildYear(),
      icon: const Icon(Icons.calendar_month),
    );
  }
}
