import 'package:flutter/material.dart';

final class ApartmentDBController {
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController floorController;
  late TextEditingController flatsController;
  late TextEditingController buildYearController;
  late ValueNotifier<bool> haveElevator;

  ApartmentDBController() {
    nameController = TextEditingController();
    addressController = TextEditingController();
    floorController = TextEditingController();
    flatsController = TextEditingController();
    buildYearController = TextEditingController();
    haveElevator = ValueNotifier<bool>(false);
  }

  void dispose() {
    nameController.dispose();
    addressController.dispose();
    floorController.dispose();
    flatsController.dispose();
    buildYearController.dispose();
    haveElevator.dispose();
  }

  void clear() {
    nameController.clear();
    addressController.clear();
    floorController.clear();
    flatsController.clear();
    buildYearController.clear();
    haveElevator.value = false;
  }

  void changeElevator() {
    haveElevator.value = !haveElevator.value;
  }
}
