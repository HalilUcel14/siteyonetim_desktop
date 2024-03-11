import 'package:app_hive/app_hive.dart';

extension TBLDaireExtension on TBLDaire {
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
