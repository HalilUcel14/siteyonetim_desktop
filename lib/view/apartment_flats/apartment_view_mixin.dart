import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

mixin ApartmentViewMixin on State<ApartmentView> {
  late TBLApartment apartment;
  //
  @override
  void initState() {
    super.initState();
    ScaffoldKeys.of.apartmentKey = GlobalKey<ScaffoldState>();
  }

  @override
  void dispose() {
    ScaffoldKeys.of.apartmentKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    //  genericObject<TBLApartment>();
    final response = context.getArgumentsWithTpye<TBLApartment>();
    //
    if (response == null) context.pop();
    //
    apartment = response!;
    super.didChangeDependencies();
  }

  Future<T?> daireDialog<T>() {
    return context.customShowDialog<T>(
      dialog: CustomDialog(
        child: FormViewDialog(
          child: DaireForm(apartment: apartment),
        ),
      ),
    );
  }
}
