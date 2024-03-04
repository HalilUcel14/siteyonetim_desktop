import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin ApartmentViewMixin on State<ApartmentView> {
  TBLApartment? apartment;
  //
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    objectRoute();
    //
    if (apartment == null) context.pop();
    //
    super.didChangeDependencies();
  }

  void objectRoute() {
    try {
      var object = ModalRoute.of(context)?.settings.arguments;
      if (object == null) return;
      if (object is TBLApartment) {
        apartment = object;
      }
    } catch (e) {
      if (kDebugMode) debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
