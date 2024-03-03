import 'package:app_hive/app_hive.dart';
import 'package:flutter/material.dart';

import '../../../index.dart';

mixin HomeBodyMixin on State<HomeViewBody> {
  late StreamListObject<TBLApartment> streamApartment;
  @override
  void initState() {
    super.initState();

    streamApartment = StreamListObject<TBLApartment>();
  }

  @override
  void dispose() {
    streamApartment.dispose();
    super.dispose();
  }

  Stream<List<TBLApartment>> apartmentStream() {
    streamApartment.updateList(
      HiveBoxesObject.of.apartmentDB.box.values.toList(),
    );
    return streamApartment.dataStream;
  }

  Future<List<TBLApartment>> apartmanList() async {
    await HiveBoxesObject.of.apartmentDB.openBox();
    final list = HiveBoxesObject.of.apartmentDB.listBox();
    List<TBLApartment> activeList = [];
    //
    for (var element in list) {
      if (element.isActive != null && element.isActive == true) {
        activeList.add(element);
      }
    }
    //
    return activeList;
  }
}
