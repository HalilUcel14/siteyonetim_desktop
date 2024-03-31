import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

extension TBLDaireOperatorExtension on TBLDaire {
  operator <(TBLApartment apartment) {
    if (apartment.flatsCount == null) return false;
    if (apartment.floorCount == null) return false;
    if (flats == null) return false;
    if (floor == null) return false;
    //
    if (apartment.flatsCount! > flats!) return false;
    if (apartment.floorCount! > floor!) return false;
    return true;
  }
}

extension TBLDaireGenericExtension on Box<TBLDaire> {
  List<TBLDaire> getAll() {
    return values.toList();
  }

  List<TBLDaire> getApartmentList(String? apartmentUid) {
    if (apartmentUid.isNullOrEmpty) {
      if (kDebugMode) debugPrint('ApartmentUid is null or empty');
      return [];
    }
    // ------------------------------
    return values
        .where((element) => element.apartmentUid == apartmentUid)
        .toList();
  }
}

extension TBLDaireCheckExtension on DaireDatabase {}

extension TBLDaireListExtension on List<TBLDaire> {
  List<TBLDaire> getApartmentFloorList(int floor) {
    if (floor < 0) {
      if (kDebugMode) debugPrint('Floor is should be upper zero');
      return [];
    }
    if (isEmpty) {
      if (kDebugMode) debugPrint('List is empty');
      return [];
    }

    return where((element) => element.floor == floor).toList();
  }
}
