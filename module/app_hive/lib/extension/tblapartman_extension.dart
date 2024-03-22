import 'package:app_hive/app_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

extension ApartmentDBExtension on TBLApartment? {
  bool get isNullable {
    if (this == null) return true;
    if (this == TBLApartment.empty()) return true;
    if (this!.uid == null) return true;
    return false;
  }
}

extension BoxGenericExtension on Box<TBLApartment> {
  List<TBLApartment> getAll() {
    return values.toList();
  }

  List<TBLApartment> getUserList(String userId) {
    return values.where((element) => element.userUid == userId).toList();
  }
}

extension ApartmentDBCheckExtension on ApartmentDatabase {
  bool isHasName(TBLApartment apartment) {
    final list = box.getUserList(apartment.userUid!);
    return list.any((element) => element.name == apartment.name);
  }

  bool isHasUid(TBLApartment apartment) {
    final list = box.getUserList(apartment.userUid!);
    return list.any((element) => element.uid == apartment.uid);
  }
}
