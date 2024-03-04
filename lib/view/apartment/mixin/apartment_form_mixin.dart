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
  late ApartmentDatabase apartmentData;

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
    //
    apartmentData = ApartmentDatabase();
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
    //
    apartmentData.closeBox();
  }

  Future<void> formValidation() async {
    await apartmentData.openBox();
    //
    if (FormKeys.of.apartmentFormKey.currentState == null) return;
    if (!FormKeys.of.apartmentFormKey.currentState!.validate()) return;
    //
    final response = await apartmentData.createNewApartment(
      name.text.trim(),
      address.text.trim(),
      int.parse(floorCount.text.trim()),
      int.parse(flatsCount.text.trim()),
      DateTime.parse(buildYear.text.trim()),
      isElevator.value,
      true, // 'İsActive
    );
    //
    if (response) {
      goToBack();
      return;
    }
    //
    if (!context.mounted) return;
    // ignore: use_build_context_synchronously
    context.showSnackBar(
      const SnackBar(
        content: Text('Apartman Oluşturulamadı'),
      ),
    );
  }

  void goToBack() {
    if (context.canPop()) {
      return context.pop();
    }
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
