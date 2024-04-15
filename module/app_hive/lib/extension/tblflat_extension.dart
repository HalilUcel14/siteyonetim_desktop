import 'package:app_hive/app_hive.dart';
import 'package:codeofland/codeofland.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

extension TBLFlatOperatorExtension on TBLFlats {
  operator <(TBLApartment apartment) {
    if (apartment.flats == null) return false;
    if (apartment.floor == null) return false;
    if (flat == null) return false;
    if (floor == null) return false;
    //
    if (apartment.flats! > flat!) return false;
    if (apartment.floor! > floor!) return false;
    return true;
  }
}

extension TBLFlatGenericExtension on Box<TBLFlats> {
  List<TBLFlats> getAll() {
    return values.toList();
  }

  List<TBLFlats> getApartmentList(String? apartmentUid) {
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

extension TBLFlatCheckExtension on FlatsDatabase {}

extension TBLFlatListExtension on List<TBLFlats> {
  List<TBLFlats> getApartmentFloorList(int floor) {
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

extension TBLFlatsCreateObjectExtension on FlatsDatabase {
  Future<HiveResponse<TBLFlats>> create(TBLFlats flats) async {
    try {
      final response = await addBox(flats.uid!, flats);
      // ------------------------------
      if (response) {
        return HiveResponse(
          hasError: false,
          message: 'Kayıt Başarılı',
          data: flats,
        );
      }
      return HiveResponse(
        hasError: true,
        message: 'Kayıt Başarısız',
        data: null,
      );
    } catch (e) {
      return HiveResponse(
        hasError: true,
        message: 'Kayıt Başarısız',
        data: null,
      );
    }
  }
}
