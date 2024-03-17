import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
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

  Widget? haveAnyApartment() {
    if (widget.apartment == null) {
      return const Center(
        child: Text('Apartment not found'),
      );
    }
    return null;
  }

  Widget? haveAnyFlats(List<TBLDaire> value) {
    if (value.isEmpty) {
      return const Center(
        child: Text('Flats not found'),
      );
    }
    return null;
  }

  List<TBLDaire> getApartmentFlats(List<TBLDaire> value) {
    if (widget.apartment!.uid.isNullOrEmpty) return [];
    // -----------------------------------
    return value
        .where((flats) => flats.apartmentUid == widget.apartment!.uid)
        .toList();
  }

  List<List<TBLDaire>> getFlatsOnFloor(List<TBLDaire> list) {
    final List<List<TBLDaire>> result = [];
    // -----------------------------------
    for (var i = 0; i < widget.apartment!.floorCount!; i++) {
      final List<TBLDaire> flatsOnFloor = list.where((flats) {
        return flats.floor == i + 1;
      }).toList();
      result.add(flatsOnFloor);
    }
    // -----------------------------------

    return result;
  }
}
