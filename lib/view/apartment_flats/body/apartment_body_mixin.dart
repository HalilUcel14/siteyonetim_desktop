import 'package:flutter/material.dart';

import '../../../index.dart';

mixin ApartmentBodyMixin on State<ApartmentViewBody> {
  late ScrollController floorController;

  @override
  void initState() {
    super.initState();

    floorController = ScrollController();
  }

  @override
  void dispose() {
    floorController.dispose();

    super.dispose();
  }
}
