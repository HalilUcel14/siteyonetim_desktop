import 'package:flutter/widgets.dart';

import '../index.dart';

mixin ApartmentFormMixin<T extends StatefulWidget> on State<T> {
  // ----------------------------
  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController floorCount;
  late TextEditingController flatsCount;
  late TextEditingController buildYear;
  late BooleanNotifier isElevator;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    address = TextEditingController();
    floorCount = TextEditingController();
    flatsCount = TextEditingController();
    buildYear = TextEditingController();
    isElevator = BooleanNotifier(false);
  }

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    floorCount.dispose();
    flatsCount.dispose();
    buildYear.dispose();
    isElevator.dispose();
    super.dispose();
  }

  checkFormValidation() {}
}
