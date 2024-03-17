import 'dart:async';

import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app_hive.dart';

class ApartmentDatabase extends IHiveManager<TBLApartment> {
  ApartmentDatabase() : super();

  ValueListenable<Box<TBLApartment>> get valueList => box.listenable();

  /// ---------------------------------
  /// Create New Apartment If not exist
  Future<bool> createNewApartment(
    String name,
    String userUid,
    String address,
    int floorCount,
    int flatsCount,
    DateTime buildYear,
    bool haveElevator,
    bool isActive,
  ) async {
    //----------------------------------------
    TBLApartment apartment = TBLApartment(
      uid: RandomKey.generate(),
      userUid: userUid,
      name: name,
      address: address,
      floorCount: floorCount,
      flatsCount: flatsCount,
      buildYear: buildYear,
      haveElevator: haveElevator,
      isActive: isActive,
    );
    //-----------------------
    if (_checkApartment(apartment)) {
      return await addBox(apartment.uid!, apartment);
    } else {
      return false;
    }
  }

  bool _checkApartment(TBLApartment apartment) {
    try {
      final List<TBLApartment> list = listBox();
      //
      if (kDebugMode) {
        debugPrint(list.toString());
      }
      //
      if (apartment.uid.isNullOrEmpty) return false;
      //
      for (var element in list) {
        if (element.name == apartment.name &&
            element.userUid == apartment.userUid) {
          return false;
        }
      }
      return true;
    } catch (e) {
      return true;
    }
  }
}
