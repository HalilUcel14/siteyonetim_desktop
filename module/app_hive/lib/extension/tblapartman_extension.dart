import 'package:app_hive/app_hive.dart';

extension ApartmentDBExtension on TBLApartment? {
  bool get isNullable {
    if (this == null) return true;
    if (this == TBLApartment.empty()) return true;
    if (this!.uid == null) return true;
    return false;
  }
}
